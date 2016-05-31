//
//  UITextField+MicrometerLevelFormat.h
//  DKRuntimeLearn
//
//  Created by demoker on 16/3/15.
//  Copyright © 2016年 demoker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MicrometerLevelFormat)
/*!
 *  @author ma dongkai, 16-03-15 18:03:03
 *
 *  @brief 打开数字千分位的开关，需要设置数字键盘、需要在
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string中打开
 *
 *  @since 1.0
 */
- (void)openMicrometerLevelFormat;

//直接赋值的时候 手动调用此方法防止光标错位
- (void)reformatAsMicrometerLevel:(UITextField *)textField;
@end
