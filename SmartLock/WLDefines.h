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
typedef NS_ENUM(NSInteger, WLFingerPrintEditType) {
    WLFingerPrintEditType_Add   = 0,    //添加指纹
    WLFingerPrintEditType_Edit  = 1,    //编辑指纹
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
