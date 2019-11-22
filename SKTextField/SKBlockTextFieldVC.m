//
//  SKBlockTextFieldVC.m
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "SKBlockTextFieldVC.h"
#import "SKBlockTextField.h"
#import "SKBlockTextView.h"

@interface SKBlockTextFieldVC ()

@end

@implementation SKBlockTextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //3.SKBlockTextField
    SKBlockTextField *blockTextField = [[SKBlockTextField alloc] init];
    [self.view addSubview:blockTextField];
    blockTextField.frame = CGRectMake(32, 200, 300, 32);
    blockTextField.limitLength = 10; //限制10个字
    blockTextField.placeholder = @"请输入内容";
    blockTextField.backgroundColor = COLORF9F9F9();
    blockTextField.returnKeyType = UIReturnKeyDone;
    blockTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    blockTextField.keyboardType = UIKeyboardTypeDefault; //设置键盘类型
    blockTextField.layer.cornerRadius = 8;
    blockTextField.layer.borderWidth = 1;
    blockTextField.layer.borderColor = COLOREDEDED().CGColor;
    blockTextField.tintColor = COLOR555555();
    blockTextField.textColor = MAINCOLOR();
    blockTextField.textFieldDidEndEditingBlock = ^(UITextField *textField) {
        NSLog(@"textField.text结束编辑 :%@", textField.text);
    };
    
    blockTextField.textFieldShouldReturnBlock = ^BOOL(UITextField *textField) {
        [textField resignFirstResponder];
        return YES;
    };
    
    
    //4.SKBlockTextView
    SKBlockTextView *blockTextView = [[SKBlockTextView alloc] init];
    [self.view addSubview:blockTextView];
    blockTextView.frame = CGRectMake(32, 280, 300, 120);
    blockTextView.limitLength = 10;
    blockTextView.placeholder = @"请输入文本框内容";
    blockTextView.layer.borderWidth = 1;
    blockTextView.layer.borderColor = COLOREDEDED().CGColor;
    blockTextView.textContainerInset = UIEdgeInsetsMake(6, 8, 6, 8);

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}





@end
