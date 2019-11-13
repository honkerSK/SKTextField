//
//  SKBlockTextView.m
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "SKBlockTextView.h"
/*
 欲用此控件就不能设置代理，用block代替
 */
@interface SKBlockTextView()<UITextViewDelegate>

@end

@implementation SKBlockTextView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 4;
        self.layer.borderWidth = 1;
    }
    return self;
}

// 写在这里为了兼容代码创建和xib创建
- (void)drawRect:(CGRect)rect {
    [self addSubview:self.placeholderLabel];
    self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:8]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    //    CGSize size = self.frame.size;
    //    [self addSubview:self.textNumLabel];
    //    self.textNumLabel.translatesAutoresizingMaskIntoConstraints = NO;
    //    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textNumLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:100]];
    //    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textNumLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:size.width - 110]];
    //    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textNumLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:size.height - 25]];
    
    self.delegate = self;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    
    NSString *toBeString = textView.text;
    if (toBeString.length > 0) { // 显示隐藏占位符
        self.placeholderLabel.hidden = YES;
    }else {
        self.placeholderLabel.hidden = NO;
    }
    
    if (self.limitLength > 0) { // 限制长度
        //获取高亮部分
        UITextRange *selectedRange = [textView markedTextRange];
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position){
            if (toBeString.length > self.limitLength){
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.limitLength];
                if (rangeIndex.length == 1){
                    textView.text = [toBeString substringToIndex:self.limitLength];
                }
                else{
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.limitLength)];
                    textView.text = [toBeString substringWithRange:rangeRange];
                }
            }
        }
    }
    
    // textNumLabel
    if (self.limitLength) { //有赋值限制字数
        self.textNumLabel.text = [NSString stringWithFormat:@"%zd/%zd",textView.text.length, self.limitLength];
        //        self.textNumLabel.text = [NSString stringWithFormat:@"%zd", self.limitLength - textView.text.length];
        if (textView.text.length >= self.limitLength) { //达到字数 字体颜色
            self.textNumLabel.textColor = WARNINGCOLOR();
            textView.layer.borderColor = WARNINGCOLOR().CGColor;
        }else { //未达到限制字数 字体颜色
            
            if(textView.text.length >= 2){
                self.textNumLabel.textColor = MAINCOLOR();
                textView.layer.borderColor = COLOREDEDED().CGColor;
            }else{
                self.textNumLabel.textColor = WARNINGCOLOR();
                textView.layer.borderColor = WARNINGCOLOR().CGColor;
            }
        }
    }else { //没有字数,不显示限制字数label
        self.textNumLabel.text = @"";
    }
    
    if (self.textViewDidChangeBlock) {
        self.textViewDidChangeBlock(textView);
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (self.textViewShouldBeginEditingBlock) {
        return self.textViewShouldBeginEditingBlock(textView);
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (self.textViewShouldEndEditingBlock) {
        self.textViewShouldEndEditingBlock(textView);
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.textViewDidBeginEditingBlock) {
        self.textViewDidBeginEditingBlock(textView);
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.textViewDidEndEditingBlock) {
        self.textViewDidEndEditingBlock(textView);
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (self.textViewShouldChangeTextInRangeReplacementTextBlock) {
        return self.textViewShouldChangeTextInRangeReplacementTextBlock(textView, range, text);
    }
    return YES;
}

#pragma mark - get
- (UILabel *)placeholderLabel {
    if (_placeholderLabel) return _placeholderLabel;
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.font = [UIFont systemFontOfSize:14];
    _placeholderLabel.numberOfLines = 0;
    return _placeholderLabel;
}

- (UILabel *)textNumLabel {
    if (_textNumLabel) return _textNumLabel;
    _textNumLabel = [[UILabel alloc] init];
    _textNumLabel.textColor = [UIColor lightGrayColor];
    _textNumLabel.font = [UIFont systemFontOfSize:14];
    _textNumLabel.textAlignment = NSTextAlignmentRight;
    if (self.limitLength) {
        _textNumLabel.text = [NSString stringWithFormat:@"0/%zd",self.limitLength];
    }
    return _textNumLabel;
}

#pragma mark - set
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLabel.text = _placeholder;
}

@end
