//
//  UIButton+HDExtension.h
//  PortableTreasure
//
//  Created by HeDong on 14/12/1.
//  Copyright © 2014年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HDExtension)

/**
 * 设置普通状态与高亮状态的背景图片
 */
- (void)hd_setN_BG:(NSString *)nbg H_BG:(NSString *)hbg;

/**
 * 设置普通状态与高亮状态的拉伸后背景图片
 */
- (void)hd_setResizeN_BG:(NSString *)nbg H_BG:(NSString *)hbg;

/**
 * 设置普通状态与高亮状态的文字
 */
- (void)hd_setNormalTitleColor:(UIColor *)nColor Higblighted:(UIColor *)hColor;

@end
