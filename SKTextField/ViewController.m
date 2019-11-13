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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //自定义textView
    SKTextView *textView = [[SKTextView alloc] init];
    [self.view addSubview:textView];
    textView.frame = CGRectMake(32, 100, 300, 120);
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


@end
