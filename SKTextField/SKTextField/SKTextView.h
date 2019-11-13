//
//  SKTextView.h
//  SKInputView
//
//  Created by KentSun on 2019/9/9.
//  Copyright © 2019 KentSun. All rights reserved.
//

//固定高度TextView 带placeholder, 限制字数
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SKTextView : UIView

//最少限定字数, minLinit默认为0
@property (nonatomic, assign) NSInteger minLimit;
//最大限定字数 ,maxLimit不设置 ,限制字数label不显示
@property (nonatomic, assign) NSInteger maxLimit;
//placeholder 为空 ,不显示占位符
@property (nonatomic, copy) NSString *placeholder;
/// 文字
@property (nonatomic, strong) NSString *text;

@property (nonatomic, copy) void(^textFieldBlock)(NSString *text);
@property (nonatomic, copy) void(^textViewShouldBeginEditingBlock)(BOOL isEditing);
@property (nonatomic, copy) void(^textViewDidEndEditingBlock)(BOOL isEditing);

@end

NS_ASSUME_NONNULL_END
