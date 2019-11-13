//
//  ViewController.m
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "ViewController.h"
#import "SKTextField/SKTextView.h"
#import "SKTextField/SKTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic ,weak) SKTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //TextField
    SKTextField *textField = [[SKTextField alloc] init];
    [self.view addSubview:textField];
    self.textField = textField;
    textField.frame = CGRectMake(32, 150, 300, 32);
    //如果需要自定义UITextField的delegate，请用textField.bridgeDelegate = self 代替
    textField.bridgeDelegate = self;
    textField.maxLength = 16; //限制16个字符
    textField.backgroundColor = COLORF9F9F9();
    
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.keyboardType = UIKeyboardTypeDefault; //设置键盘类型
    textField.layer.cornerRadius = 8;
    textField.layer.borderWidth = 2;
    textField.layer.borderColor = MAINCOLOR().CGColor;
    textField.tintColor = MAINCOLOR();
    textField.textColor = MAINCOLOR();
    //    textField.placeholder = @"输入活动标题";
    
    //设置占位文字颜色
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入内容" attributes:@{NSForegroundColorAttributeName:COLORCCCCCC(),NSFontAttributeName:textField.font}];
    textField.attributedPlaceholder = attrString;
   
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    //TextView
    SKTextView *textView = [[SKTextView alloc] init];
    [self.view addSubview:textView];
    textView.frame = CGRectMake(32, 230, 300, 120);
    textView.maxLimit = 100; //最大限制字数 100
    textView.minLimit = 3;  //3个字以内变红
    textView.placeholder = @"请输入内容";
    textView.textFieldBlock = ^(NSString * _Nonnull text) {
        NSLog(@"文字输出内容 : %@", text);
    };
    textView.textViewShouldBeginEditingBlock = ^(BOOL isEditing) {
        NSLog(@"将要开始编辑");
    };
    textView.textViewDidEndEditingBlock = ^(BOOL isEditing) {
        NSLog(@"已经结束编辑");
    };

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark UITextFieldDelegate
#pragma mark ================== UITextFieldDelegate ======================
// 点击done 保存数据
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *str = textField.text;
    if (str.length == 0) {
         textField.layer.borderColor = MAINCOLOR().CGColor;
    }
    
}

- (void)textFieldDidChange:(UITextField *)textField{
    NSString *textStr = textField.text;
    //不符合条件标红小于2个字或者大于16个字标红
    if (textStr.length >= 2 && textStr.length <= 16) {
        textField.layer.borderColor = MAINCOLOR().CGColor;
    }else{
        textField.layer.borderColor = WARNINGCOLOR().CGColor;
    }
}

@end
