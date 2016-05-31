//
//  UITextField+MicrometerLevelFormat.m
//  DKRuntimeLearn
//
//  Created by demoker on 16/3/15.
//  Copyright © 2016年 demoker. All rights reserved.
//

#import "UITextField+MicrometerLevelFormat.h"
#import <objc/runtime.h>
@interface UITextField ()
@property (retain, nonatomic) UITextRange * textrange;
@property (retain, nonatomic) NSString * preString;
@end

@implementation UITextField (MicrometerLevelFormat)

static char kTextRange;
static char kPreString;

#pragma mark - method swizzle
- (void)setTextrange:(UITextRange *)textrange{
    objc_setAssociatedObject(self, &kTextRange, textrange, OBJC_ASSOCIATION_COPY);
}
- (UITextRange *)textrange{
   return objc_getAssociatedObject(self, &kTextRange);
}

- (void)setPreString:(NSString *)preString{
    objc_setAssociatedObject(self, &kPreString, preString, OBJC_ASSOCIATION_COPY);
}

- (NSString *)preString{
    return objc_getAssociatedObject(self, &kPreString);
}

#pragma mark - 千分位
//开启千分位模式
- (void)openMicrometerLevelFormat {
    
    [self addTarget:self action:@selector(reformatAsMicrometerLevel:) forControlEvents:UIControlEventEditingChanged];
    NSLog(@"++++ = %lu",(unsigned long)[[self allTargets] count]);
    [self configSelectedRange];
}

#pragma mark - private method
//千分位校验
- (void)reformatAsMicrometerLevel:(UITextField *)textField {
    NSString *replaceString = [textField.text stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    //[numberFormatter setPositiveFormat:@"###,###.00"];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSString * formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:replaceString.doubleValue]];
    
    textField.text = formattedNumberString;
    
    textField.selectedTextRange = self.textrange;   //保证光标在逗号后时，删除功能正常
    
    NSString * beforeString = self.preString;
    NSString * afterString = formattedNumberString;
    
    NSInteger off ;
    UITextPosition *newPos;
    
    if(beforeString.length - afterString.length == 1){//仅减一个数字
        off = -1;
        newPos = [textField positionFromPosition:self.textrange.start offset:off];
        textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
    }else if (beforeString.length - afterString.length == 2){//减一个数字  一个逗号
        off = -2;
        newPos = [textField positionFromPosition:self.textrange.start offset:off];
        textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
    }else if (beforeString.length - afterString.length == -1){//仅加一个数字
        off = 1;
        newPos = [textField positionFromPosition:self.textrange.end offset:off];
        textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
    }else if (beforeString.length-afterString.length == -2){//加一个数字  一个逗号
        off = 2;
        newPos = [textField positionFromPosition:self.textrange.start offset:off];
        textField.selectedTextRange = [textField textRangeFromPosition:newPos toPosition:newPos];
    }
    
    self.preString = formattedNumberString;//把修改之后的赋值给prestring
}

- (void)configSelectedRange{
    UITextRange *selectedRange = [self selectedTextRange];
    [self textRange:selectedRange];
}
//传回光标的位置
- (void)textRange:(UITextRange *)range {
    self.textrange = range;
}


@end
