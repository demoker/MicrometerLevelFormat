//
//  ViewController.m
//  MicrometerLevelFormat
//
//  Created by demoker on 16/3/15.
//  Copyright © 2016年 demoker. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+MicrometerLevelFormat.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *mTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mTextField.delegate = self;
    _mTextField.keyboardType = UIKeyboardTypeNumberPad;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    [textField openMicrometerLevelFormat];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
