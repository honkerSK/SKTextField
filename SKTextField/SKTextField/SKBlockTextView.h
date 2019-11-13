//
//  SKBlockTextView.h
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

@interface SKBlockTextView : UITextView

@property (nonatomic, assign) NSInteger limitLength;

@property (nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UILabel *textNumLabel; //限制字数label

#pragma mark - UITextViewDelegate

@property (nonatomic, copy) void (^textViewDidChangeBlock)(UITextView *textView);
@property (nonatomic, copy) BOOL (^textViewShouldBeginEditingBlock)(UITextView *textView);
@property (nonatomic, copy) BOOL (^textViewShouldEndEditingBlock)(UITextView *textView);
@property (nonatomic, copy) void (^textViewDidBeginEditingBlock)(UITextView *textView);
@property (nonatomic, copy) void (^textViewDidEndEditingBlock)(UITextView *textView);
@property (nonatomic, copy) BOOL (^textViewShouldChangeTextInRangeReplacementTextBlock)(UITextView *textView, NSRange range, NSString *text);

@end

NS_ASSUME_NONNULL_END
