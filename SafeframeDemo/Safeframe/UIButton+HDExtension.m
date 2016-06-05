//
//  UIButton+HDExtension.m
//  PortableTreasure
//
//  Created by HeDong on 14/12/1.
//  Copyright © 2014年 hedong. All rights reserved.
//

#import "UIButton+HDExtension.h"

@implementation UIButton (HDExtension)

- (void)hd_setN_BG:(NSString *)nbg H_BG:(NSString *)hbg
{
    [self setBackgroundImage:[UIImage imageNamed:nbg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:hbg] forState:UIControlStateHighlighted];
}

- (void)hd_setNormalTitleColor:(UIColor *)nColor Higblighted:(UIColor *)hColor
{
    [self setTitleColor:nColor forState:UIControlStateNormal];
    [self setTitleColor:hColor forState:UIControlStateHighlighted];
}

- (void)hd_setResizeN_BG:(NSString *)nbg H_BG:(NSString *)hbg
{
    UIImage *normalImage = [UIImage imageNamed:nbg];
    int normalLeftCap = normalImage.size.width * 0.5;
    int normalTopCap = normalImage.size.height * 0.5;
    [self setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:normalLeftCap topCapHeight:normalTopCap] forState:UIControlStateNormal];
    
    UIImage *highlightedImage = [UIImage imageNamed:hbg];
    int highlightedImageLeftCap = normalImage.size.width * 0.5;
    int highlightedImageTopCap = normalImage.size.height * 0.5;
    [self setBackgroundImage:[highlightedImage stretchableImageWithLeftCapWidth:highlightedImageLeftCap topCapHeight:highlightedImageTopCap] forState:UIControlStateHighlighted];
}

@end
