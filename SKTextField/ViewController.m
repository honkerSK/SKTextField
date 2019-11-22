//
//  ViewController.m
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "ViewController.h"

#import "SKTextFieldVC.h"
#import "SKBlockTextFieldVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:delegateBtn];
    delegateBtn.frame = CGRectMake(150, 150, 100, 30);
    [delegateBtn setTitle:@"代理限制字数" forState:UIControlStateNormal];
    [delegateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    delegateBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    delegateBtn.backgroundColor = [UIColor orangeColor];
    [delegateBtn addTarget:self action:@selector(delegateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:blockBtn];
    blockBtn.frame = CGRectMake(150, 300, 100, 30);
    [blockBtn setTitle:@"Block限制字数" forState:UIControlStateNormal];
    [blockBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    blockBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    blockBtn.backgroundColor = [UIColor orangeColor];
    [blockBtn addTarget:self action:@selector(blockBtnClick) forControlEvents:UIControlEventTouchUpInside];
    

}


- (void)delegateBtnClick{
    SKTextFieldVC *textFieldVC = [[SKTextFieldVC alloc] init];
    [self.navigationController pushViewController:textFieldVC animated:YES];
}

- (void)blockBtnClick{
    SKBlockTextFieldVC *blockTextFieldVC = [[SKBlockTextFieldVC alloc] init];
    [self.navigationController pushViewController:blockTextFieldVC animated:YES];
}



@end
