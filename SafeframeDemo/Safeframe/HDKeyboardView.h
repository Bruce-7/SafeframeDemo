//
//  HDKeyboardView.h
//  PortableTreasure
//
//  Created by xiaomi on 15/12/5.
//  Copyright (c) 2015年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HDKeyboardBtnNumTeyp)
{
    HDKeyboardBtnNumOne = 1,
    HDKeyboardBtnNumTwo = 2,
    HDKeyboardBtnNumThree = 3,
    HDKeyboardBtnNumFour = 4,
    HDKeyboardBtnNumFive = 5,
    HDKeyboardBtnNumSix = 6,
    HDKeyboardBtnNumSeven = 7,
    HDKeyboardBtnNumEight = 8,
    HDKeyboardBtnNumNine = 9,
    HDKeyboardBtnNumHide = 10, // 隐藏按键
    HDKeyboardBtnNumZero = 11,
    HDKeyboardBtnNumDelete = 12 // 删除按键
};

@protocol HDKeyboardViewDelegate <NSObject>

@optional

/**
 *  键盘按钮被点击就告诉代理对象
 *
 *  @param btn 对应的被点击按键(取出tag对应的值) 为HDKeyboardBtnNumTeyp枚举(也可定义titel取值不用枚举tag)
 */
- (void)keyboardViewBtnClick:(UIButton *)btn;

@end

@interface HDKeyboardView : UIView

/**
 *  快速创建对象
 */
+ (instancetype)keyboardView;

@property (nonatomic, weak) id <HDKeyboardViewDelegate> delegate;

@end
