//
//  SKBlockTextField.h
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 欲用此控件就不能设置代理，用block代替
 */
NS_ASSUME_NONNULL_BEGIN

@interface SKBlockTextField : UITextField
/** 限制长度*/
@property (nonatomic, assign) NSInteger limitLength;

#pragma mark - UITextFieldDelegate block

/** 文本发生改变*/
@property (nonatomic, copy) void (^textFieldTextEditingChangedBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldBeginEditingBlock)(UITextField *textField);
@property (nonatomic, copy) void (^textFieldDidBeginEditingBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldEndEditingBlock)(UITextField *textField);
@property (nonatomic, copy) void (^textFieldDidEndEditingBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldReturnBlock)(UITextField *textField);
@property (nonatomic, copy) BOOL (^textFieldShouldChangeCharactersInRangeReplacementStringBlock)(UITextField *textField, NSRange range, NSString *string);

@end

NS_ASSUME_NONNULL_END
