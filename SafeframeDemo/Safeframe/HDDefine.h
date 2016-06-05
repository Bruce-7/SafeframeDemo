//
//  HDDefine.h
//  PortableTreasure
//
//  Created by HeDong on 15/03/20.
//  Copyright © 2015年 hedong. All rights reserved.
//

//// 判断是真机还是模拟器
//#if TARGET_OS_IPHONE
//// iPhone Device
//#endif
//
//#if TARGET_IPHONE_SIMULATOR
//// iPhone Simulator
//#endif

// 由角度获取弧度
#define HDDegreesToRadian(x) (M_PI * (x) / 180.0)
// 由弧度获取角度
#define HDRadianToDegrees(radian) (radian * 180.0) / (M_PI)

#define HDUserDefaults [NSUserDefaults standardUserDefaults]
#define HDKeyWindow [UIApplication sharedApplication].keyWindow
#define HDRootViewController HDKeyWindow.rootViewController

/** APP版本号 */
#define HDAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP BUILD 版本号 */
#define HDAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** APP名字 */
#define HDAppDisplayName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
/** 当前语言 */
#define HDLocalLanguage [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
/** 当前国家 */
#define HDLocalCountry [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]


/******* RGB颜色 *******/
#define HDColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0  blue:(b) / 255.0  alpha:1.0]
/******* RGB颜色 *******/


/******* 屏幕尺寸 *******/
#define HDMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define HDMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define HDMainScreenBounds [UIScreen mainScreen].bounds
/******* 屏幕尺寸 *******/


/******* 设备型号和系统 *******/
/** 检查系统版本 */
#define HDSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define HDSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HDSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define HDSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
/** 系统和版本号 */
#define HDDevice [UIDevice currentDevice]
#define HDDeviceName HDDevice.name                           // 设备名称
#define HDDeviceModel HDDevice.model                         // 设备类型
#define HDDeviceLocalizedModel HDDevice.localizedModel       // 本地化模式
#define HDDeviceSystemName HDDevice.systemName               // 系统名字
#define HDDeviceSystemVersion HDDevice.systemVersion         // 系统版本
#define HDDeviceOrientation HDDevice.orientation             // 设备朝向
#define HDDeviceUUID HDDevice.identifierForVendor.UUIDString // UUID
#define HDiOS8 ([HDDeviceSystemVersion floatValue] >= 8.0)   // iOS8以上
#define HDiPhone ([HDDeviceModel rangeOfString:@"iPhone"].length > 0)
#define HDiPod ([HDDeviceModel rangeOfString:@"iPod"].length > 0)
#define HDiPad (HDDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
/******* 设备型号和系统 *******/


/******* 日志打印替换 *******/
#ifdef DEBUG
// Debug
#define HDLog(FORMAT, ...) fprintf(stderr, "%s [%d lines] %s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
// Release
#define HDLog(FORMAT, ...) nil
#endif
/******* 日志打印替换 *******/
