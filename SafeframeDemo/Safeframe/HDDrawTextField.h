//
//  HDDrawTextField.h
//  PortableTreasure
//
//  Created by xiaomi on 15/12/26.
//  Copyright © 2015年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const HDDrawTextFieldIsShowPasswordNotification; // 是否显示密码的通知

@interface HDDrawTextField : UITextField

/**
 *  快速创建对象
 */
+ (instancetype)drawTextField;

@end
