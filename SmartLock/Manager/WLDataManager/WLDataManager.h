//
//  WLDataManager.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLFingerPrint;
@class WLPassword;

@interface WLDataManager : NSObject

+ (instancetype)sharedManager;


@property (class,nonatomic,readonly) NSArray<WLFingerPrint *> *fingerPrintList; //开门指纹列表
@property (class,nonatomic,readonly) NSArray<WLPassword *>    *passwordList;    //开门密码列表

@end
