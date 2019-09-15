//
//  MyDefines.h
//  MyCategory
//
//  Created by MG_PDY on 2019/5/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#ifndef MyDefines_h
#define MyDefines_h




#pragma mark - 屏幕相关

#define ScreenBounds        UIScreen.mainScreen.bounds
#define ScreenSize          ScreenBounds.size

#ifndef ScreenWidth
#define ScreenWidth         ScreenSize.width
#endif

#ifndef ScreenHeight
#define ScreenHeight        ScreenSize.height
#endif


#pragma mark -

#define CurrScreenSize          UIScreen.mainScreen.currentMode.size
#define EqualToSize(W, H)       (CurrentScreenSize.width == W && CurrentScreenSize.height == H)
#define is_3_5_Inch             EqualToSize(640, 960)   //320 x 480     @2x     📱iPhone 4s [4]
#define is_4_0_Inch             EqualToSize(640, 1136)  //320 x 568     @2x     📱iPhone SE [5s、5c、5]
#define is_4_7_Inch             EqualToSize(750, 1334)  //375 x 667     @2x     📱iPhone 8（7、6s、6）
#define is_5_5_Inch             EqualToSize(1242, 2208) //414 x 736     @3x     📱iPhone 8 [7、6s、6] Plus
#define is_5_8_Inch             EqualToSize(1125, 2436) //375 x 812     @2x     📱iPhone XS [X]
#define is_6_1_Inch             EqualToSize(828, 1792)  //414 x 896     @2x     📱iPhone XR
#define is_6_5_Inch             EqualToSize(1242, 2688) //414 x 896     @3x     📱iPhone XS Max

//是否小屏手机
#define is_SmallScreen          (is_3_5_Inch || is_4_0_Inch)

#define is_iPhone_X             is_iPhoneX_Series()

#define DYLength_360(L)         (is_SmallScreen ? (ScreenWidth / 360 * (L)) : (L))
#define DYLength_375(L)         (is_SmallScreen ? (ScreenWidth / 375 * (L)) : (L))




#pragma mark - iOS系统版本

//当前系统版本号（字符串，如：@"11.0"）
#define kSystemVersion_str      [UIDevice currentDevice].systemVersion
//当前系统版本号（小数，如：11.0）
#define kSystemVersion_f        [kSystemVersion_str floatValue]

#define is_iOS_(intV)          (kSystemVersion_f >= floorf(v) && kSystemVersion_f < floorf(intV + 1))
#define is_iOS_6                is_iOS_(6)
#define is_iOS_7                is_iOS_(7)
#define is_iOS_8                is_iOS_(8)
#define is_iOS_9                is_iOS_(9)
#define is_iOS_10               is_iOS_(10)
#define is_iOS_11               is_iOS_(11)
#define is_iOS_12               is_iOS_(12)

#define isPrior_iOS_(v)         (kSystemVersion_f < (v))
#define isPriorOr_iOS_(v)       (kSystemVersion_f <= (v))
#define isLater_iOS_(v)         (kSystemVersion_f > (v))
#define isLaterOr_iOS_(v)       (kSystemVersion_f >= (v))
#define isBetween_iOS_(v1, v2)  (kSystemVersion_f >= (v1) && kSystemVersion_f <= (v2))

#define isPriorOr_iOS_11        isPriorOr_iOS_(11)




#pragma mark - 系统控件高度相关

#define kStatusBarHeight        (is_iPhone_X ? 44 : 20)
#define kNavBarHeight           44
#define kTopBarHeight           (kStatusBarHeight + kNavBarHeight)
#define kTabBarHeight           49
#define kBottomExtHeight        (is_iPhone_X ? 34 : 0)
#define kBottomBarHeight        (kTabBarHeight + kBottomBarHeight)




#pragma mark - 字体相关

//系统字体
#define WLFont_Regular(size)    [UIFont systemFontOfSize:(size) weight:UIFontWeightRegular]
#define WLFont_Medium(size)     [UIFont systemFontOfSize:(size) weight:UIFontWeightMedium]
#define WLFont_Bold(size)       [UIFont systemFontOfSize:(size) weight:UIFontWeightBold]
#define WLFont_Semibold(size)   [UIFont systemFontOfSize:(size) weight:UIFontWeightSemibold]




#pragma mark - 颜色相关

#define WLColor_(v)             RGBA((v), (v), (v), 1)
#define WLColor_51              RGBA(51, 51, 51, 1)
#define WLColor_110             RGBA(110, 110, 110, 1)
#define WLColor_153             RGBA(153, 153, 153, 1)
#define WLColor_179             RGBA(179, 179, 179, 1)
#define WLColor_210             RGBA(210, 210, 210, 1)
#define WLColor_240             RGBA(240, 240, 240, 1)
#define WLColor_245             RGBA(245, 245, 245, 1)




#pragma mark -

#define WeakSelf(weakSelf)    __weak __typeof__(self) weakSelf = self;



#pragma mark - 设备尺寸、型号

typedef NS_ENUM(NSInteger, WLScreenInch) {
    WLScreenInch_3_5    = 35,
    WLScreenInch_4_0    = 40,
    WLScreenInch_4_7    = 47,
    WLScreenInch_5_5    = 55,
    WLScreenInch_5_8    = 58,
    WLScreenInch_6_1    = 61,
    WLScreenInch_6_5    = 65,
};
typedef NS_ENUM(NSInteger, WLiPhone) {
    WLiPhone_1,
    WLiPhone_2G,
    WLiPhone_3G,
    WLiPhone_3GS,
    
    WLiPhone_4,
    WLiPhone_4s,
    
    WLiPhone_5,
    WLiPhone_5s,
    WLiPhone_5c,
    
    WLiPhone_6,
    WLiPhone_6_Plus,
    
    WLiPhone_6s,
    WLiPhone_6s_Plus,
    
    WLiPhone_SE,
    
    WLiPhone_7,
    WLiPhone_7_Plus,
    
    WLiPhone_8,
    WLiPhone_8_Plus,
    WLiPhone_X,
    
    WLiPhone_XS,
    WLiPhone_XS_Max,
    WLiPhone_XR,
};




#pragma mark - 通用代码块

typedef void(^WLBlock_Void)(void);
typedef void(^WLBlock_Str)(NSString *str);
typedef void(^WLBlock_Obj)(id obj);
typedef void(^WLBlock_Integer)(NSInteger intValue);
typedef void(^WLBlock_Bool)(BOOL flag);

#endif /* MyDefines_h */
