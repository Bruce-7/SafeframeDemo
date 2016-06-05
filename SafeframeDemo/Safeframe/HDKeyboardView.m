//
//  HDKeyboardView.m
//  PortableTreasure
//
//  Created by xiaomi on 15/12/5.
//  Copyright (c) 2015年 hedong. All rights reserved.
//  键盘视图

#import "HDKeyboardView.h"
#import "UIView+HDExtension.h"
#import "UIButton+HDExtension.h"
#import "HDDefine.h"

static const NSUInteger KeyboardButtons = 12;
static const NSUInteger KeyboardHeight = 216;

@interface HDKeyboardView ()

@end

@implementation HDKeyboardView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat width = self.hd_width;
        CGFloat height = KeyboardHeight; // 一般键盘的高度
        CGFloat x = 0;
        CGFloat y = HDMainScreenHeight + height;
        
        self.frame = CGRectMake(x, y, width, height);
        
        [self setupSubViews];
    }
    return self;
}

+ (instancetype)keyboardView
{
    HDKeyboardView *keyboardView = [[self alloc] init];
    return keyboardView;
}

/**
 *  设置子视图
 */
- (void)setupSubViews
{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM removeAllObjects];
    
    for (int i = 0 ; i < 10; i++)
    {
        int j = arc4random_uniform(10);
        NSNumber *number = [[NSNumber alloc] initWithInt:j];
        
        if ([arrM containsObject:number])
        {
            i--;
            continue;
        }
        [arrM addObject:number];
    }
    
    NSNumber *number = [[NSNumber alloc] init];
    
    for (int i = 0; i < KeyboardButtons; i++)
    {
        if (i < 10)
        {
            number = arrM[i];
        }

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i < 9 || i == 10)
        {
            [btn hd_setResizeN_BG:@"Safeframe.bundle/c_chaKeyboardButton" H_BG:@"Safeframe.bundle/c_chaKeyboardButtonSel"];
            
            btn.tag = number.integerValue + 1; // 对应枚举取值对应的值 (也可定义titel取值不用枚举tag)
            [btn setTitle:[NSString stringWithFormat:@"%ld", (long)btn.tag] forState:UIControlStateNormal];
            
            if (btn.tag == 10)
            {
                btn.tag = HDKeyboardBtnNumZero;
                [btn setTitle:[NSString stringWithFormat:@"%d", 0] forState:UIControlStateNormal];
            }
        }
        else if (9 == i)
        {
            [btn hd_setResizeN_BG:@"Safeframe.bundle/c_chaKeyboardButton" H_BG:@"Safeframe.bundle/c_chaKeyboardButtonSel"];
            btn.tag = i + 1;
            [btn setTitle:[NSString stringWithFormat:@"隐藏"] forState:UIControlStateNormal];
        }
        else
        {
            [btn hd_setN_BG:@"Safeframe.bundle/c_number_keyboardDeleteButton" H_BG:@"Safeframe.bundle/c_number_keyboardDeleteButtonSel"];
            btn.tag = i + 1;
        }
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(keyboardViewBtnClick:)])
    {
        [self.delegate keyboardViewBtnClick:btn];
    }
}

/**
 *  布置子视图frame
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    NSUInteger row = 3;
    NSUInteger column = 4;
    CGFloat btnWidth = (self.hd_width - (row + 1) * margin) / row; // 每个按钮的宽
    CGFloat btnHeight = (KeyboardHeight - (column + 1) * margin) / column; // 每个按钮的高
    
    for (int i = 0; i < self.subviews.count; i++)
    {
        UIButton *btn = self.subviews[i];
        
        NSUInteger x = i % row * (margin + btnWidth) + margin;
        NSUInteger y = i / row * (margin + btnHeight) + margin;
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    }
}

@end

