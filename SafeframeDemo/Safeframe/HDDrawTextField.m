//
//  HDDrawTextField.m
//  PortableTreasure
//
//  Created by xiaomi on 15/12/26.
//  Copyright © 2015年 hedong. All rights reserved.
//  密码画图文本框

#import "HDDrawTextField.h"
#import "HDKeyboardView.h"
#import "HDDefine.h"
#import "UIView+HDExtension.h"

NSString * const HDDrawTextFieldIsShowPasswordNotification = @"HDDrawTextFieldIsShowPasswordNotification";

@interface HDDrawTextField () <HDKeyboardViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) UITextField *textField;

@property (nonatomic, assign) BOOL isShowPassword;

@end

@implementation HDDrawTextField

static const NSUInteger PwdPointCount = 6; // 最多6位密码

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showPassword:) name:HDDrawTextFieldIsShowPasswordNotification object:nil];
        
        [self setupSubviews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showPassword:) name:HDDrawTextFieldIsShowPasswordNotification object:nil];
        
        [self setupSubviews];
    }
    
    return self;
}

+ (instancetype)drawTextField
{
    HDDrawTextField *drawTextField = [[self alloc] init];
    
    return drawTextField;
}

- (void)showPassword:(NSNotification *)not
{
    self.isShowPassword = !self.isShowPassword;
    
    [self setNeedsDisplay];
}

- (void)setupSubviews
{
    HDKeyboardView *keyboardView = [HDKeyboardView keyboardView];
    
    keyboardView.delegate = self;
    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = self;
    
    textField.inputView = keyboardView;
    [textField becomeFirstResponder];
    [self addSubview:textField];
    self.textField = textField;
}

static BOOL textFieldState = YES;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (NO == textFieldState)
    {
        [UIView animateWithDuration:0.5 animations:^{
            [self.textField becomeFirstResponder];
            textFieldState = YES;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            [self.textField resignFirstResponder];
            textFieldState = NO;
        }];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSString *)textContent
{
    return self.textField.text;
}

#pragma mark - HDKeyboardViewDelegate
/**
 *  键盘按钮被点击就告诉代理对象
 *
 *  @param btn 对应的被点击按键(取出对应的值)
 */
- (void)keyboardViewBtnClick:(UIButton *)btn
{
    if (btn.tag == HDKeyboardBtnNumHide)
    {
        [self endEditing:YES];
        return;
    }

    if (btn.tag == HDKeyboardBtnNumDelete)
    {
        if (self.textField.text.length > 0)
        {
            [self.textField deleteBackward]; // 从光标后面删除
        }
        
        [self setNeedsDisplay];
    }
    
    if (self.textField.text.length < 6)
    {
        NSString *temp = nil;
        if (btn.tag == HDKeyboardBtnNumZero)
        {
            temp = [NSString stringWithFormat:@"%d", 0];
            [self.textField insertText:temp]; // 插入到光标后面
        }
        
        if (btn.tag >= HDKeyboardBtnNumOne && btn.tag <= HDKeyboardBtnNumNine)
        {
            temp = [NSString stringWithFormat:@"%ld", (long)btn.tag];
            [self.textField insertText:temp];
        }
        
        [self setNeedsDisplay];
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(drawTextFieldDidBeginEditing:)])
    {
        [self.delegate drawTextFieldDidBeginEditing:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(drawTextFieldDidEndEditing:)])
    {
        [self.delegate drawTextFieldDidEndEditing:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(self.hd_x, self.hd_y, self.hd_width, self.hd_width / PwdPointCount);
}

#pragma mark - 绘画
/**
 *  绘画
 */
- (void)drawRect:(CGRect)rect
{
    // 画图
    UIImage *field = [UIImage imageNamed:@"Safeframe.bundle/password_in"];
    
    CGFloat fieldX = 0;
    CGFloat fieldY = 0;
    CGFloat fieldW = self.hd_width;
    CGFloat fieldH = self.hd_height;
    
    [field drawInRect:CGRectMake(fieldX, fieldY, fieldW, fieldH)];
    
    CGFloat pointH = fieldH * 0.5;
    CGFloat pointW = pointH;
    CGFloat margin = (fieldH - pointH) * 0.5;
    CGFloat pointY = margin;
    CGFloat pointX = 0;
    
    if (self.isShowPassword == YES)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:18.0];
        
        for (int i = 0; i < self.textField.text.length; i++)
        {
            NSString *str = [NSString stringWithFormat:@"%c", [self.textField.text characterAtIndex:i]];
            pointX = margin + i * (pointW + margin * 2);

            [str drawInRect:CGRectMake(pointX, pointY, pointW, pointH) withAttributes:dic];
        }
    }
    else
    {
        // 画点
        UIImage *pointImage = [UIImage imageNamed:@"Safeframe.bundle/yuan"];
        
        for (int i = 0; i < self.textField.text.length; i++)
        {
            pointX = margin + i * (pointW + margin * 2);
            [pointImage drawInRect:CGRectMake(pointX, pointY, pointW, pointH)];
        }
    }
}

@end
