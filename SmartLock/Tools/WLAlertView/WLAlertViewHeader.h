//
//  WLAlertViewHeader.h
//  PDYDemos
//
//  Created by MG_PDY on 2019/4/1.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#ifndef WLAlertViewHeader_h
#define WLAlertViewHeader_h

typedef NS_ENUM(NSInteger, WLAlertStyle) {
    WLAlertStyle_TxtOnly    = 0,    //只显示【文本】
    WLAlertStyle_AttrTxt    = 1,    //富文本
    WLAlertStyle_ActOnly    = 2,    //只显示【活动指示器】
    WLAlertStyle_ImgOnly    = 3,    //只显示【图片】
    WLAlertStyle_ActTxt     = 4,    //显示【活动指示器】和【文本】
    WLAlertStyle_ImgTxt     = 5,    //显示【图片】和【文本】
    
    WLAlertStyle_Custom     = 6,    //自定义
};
typedef NS_ENUM(NSInteger, WLAlertBgStyle) {
    
    WLAlertBgStyle_None     = -1,
    
    WLAlertBgStyle_White    = 0,    //白色背景
    WLAlertBgStyle_Black    = 1,    //黑色背景
    WLAlertBgStyle_Blur     = 2,    //模糊背景
};
static NSTimeInterval WLAlertViewDefaultHideDelay  = 1.5f;

#endif /* WLAlertViewHeader_h */
