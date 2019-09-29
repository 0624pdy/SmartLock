//
//  WLDefines.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#ifndef WLDefines_h
#define WLDefines_h

#pragma mark - 枚举

typedef NS_ENUM(NSInteger, WLCellAccessoryType) {
    WLCellAccessoryType_None    = 0,
    WLCellAccessoryType_Arrow   = 1,
    WLCellAccessoryType_Switch  = 2,
    WLCellAccessoryType_Custom  = 100,
};
typedef NS_ENUM(NSInteger, WLFingerPrintOptType) {
    WLFingerPrintOptType_Add    = 0,    //添加指纹
    WLFingerPrintOptType_Reset  = 1,    //重录指纹
    WLFingerPrintOptType_Verify = 2,    //校验指纹
};
typedef NS_ENUM(NSInteger, WLVcType) {
    
    WLVcType_Unknown            = 0,    //未知
    
    WLVcType_List_FingerPrint   = 1,    //列表 - 开门指纹
    WLVcType_List_Password      = 2,    //列表 - 开门密码
    
    WLVcType_Form_FingerName    = 3,    //表单 - 指纹名称 -
    WLVcType_Form_PasswordName  = 4,    //表单 - 密码名称
    WLVcType_Form_Password      = 5,    //表单 - 密码
    
    WLVcType_Detail_Finger      = 6,    //详情 - 指纹
    WLVcType_Detail_Password    = 7,    //详情 - 密码
    
    WLVcType_Validate_Finger    = 7,    //验证 - 指纹
};




#pragma mark -

static NSString *WLKey_Volumn   = @"WLKey_Volumn";
static NSString *WLKey_Shake    = @"WLKey_Shake";

#define WLItems_Volumn  @[ @"静音", @"低音量", @"中音量", @"高音量" ]
static NSString *WLDefault_Volumn = @"静音";

#define WLItems_Shake   @[ @"不震动", @"低震动", @"中震动", @"高震动" ]
static NSString *WLDefault_Shake = @"不震动";




#pragma mark - 通知

static NSString *WLNotification_StartUsingApp = @"WLNotification_StartUsingApp";

#endif /* WLDefines_h */
