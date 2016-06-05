//
//  HDDrawTextField.h
//  PortableTreasure
//
//  Created by xiaomi on 15/12/26.
//  Copyright © 2015年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const HDDrawTextFieldIsShowPasswordNotification; // 是否显示密码的通知

@class HDDrawTextField;

@protocol HDDrawTextFieldDelegate <NSObject>

@optional
- (void)drawTextFieldDidBeginEditing:(HDDrawTextField *)drawTextField;
- (void)drawTextFieldDidEndEditing:(HDDrawTextField *)drawTextField;

@end

@interface HDDrawTextField : UIView

/**
 *  快速创建对象
 */
+ (instancetype)drawTextField;

/**
 *  获取文本框内容
 */
@property (nonatomic, copy, readonly) NSString *textContent;

@property (nonatomic, weak) id <HDDrawTextFieldDelegate> delegate;

@end
