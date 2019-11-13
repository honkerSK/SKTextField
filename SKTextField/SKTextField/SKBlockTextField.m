//
//  SKBlockTextField.m
//  SKTextField
//
//  Created by macApple on 2019/11/13.
//  Copyright © 2019 KentSun. All rights reserved.
//

#import "SKBlockTextField.h"
/*
 欲用此控件就不能设置代理，用block代替
 */
@interface SKBlockTextField()<UITextFieldDelegate>


@end

@implementation SKBlockTextField


//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self addTarget:self action:@selector(textFieldTextEditingChanged:) forControlEvents:UIControlEventEditingChanged];
//        self.delegate = self;
//    }
//    return self;
//}

// 控制还未输入时文本的位置，缩进14
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 14, 0);
}
// 控制输入后文本的位置，缩进14
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 14, 0);
}

// 写在这里为了兼容代码创建和xib创建
- (void)drawRect:(CGRect)rect {
    [self addTarget:self action:@selector(textFieldTextEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    self.delegate = self;
}

- (void)textFieldTextEditingChanged:(id)sender {
    if (self.limitLength == 0) {
        return;
    }
    if (self.textFieldTextEditingChangedBlock) {
        self.textFieldTextEditingChangedBlock(sender);
    }
    UITextField *textField = (UITextField *)sender;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > self.limitLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.limitLength];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:self.limitLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.limitLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.textFieldShouldBeginEditingBlock) {
        return self.textFieldShouldBeginEditingBlock(textField);
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.textFieldDidBeginEditingBlock) {
        self.textFieldDidBeginEditingBlock(textField);
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.textFieldShouldEndEditingBlock) {
        return self.textFieldShouldEndEditingBlock(textField);
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.textFieldDidEndEditingBlock) {
        self.textFieldDidEndEditingBlock(textField);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.textFieldShouldReturnBlock) {
        return self.textFieldShouldReturnBlock(textField);
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.textFieldShouldChangeCharactersInRangeReplacementStringBlock) {
        return self.textFieldShouldChangeCharactersInRangeReplacementStringBlock(textField, range, string);
    }
    return YES;
}

//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0); // if implemented, called in place of textFieldDidEndEditing:
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//
//}


@end
