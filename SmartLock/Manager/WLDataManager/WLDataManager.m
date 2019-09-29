//
//  WLDataManager.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLDataManager.h"

@implementation WLDataManager

+ (instancetype)sharedManager {
    static WLDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WLDataManager alloc] init];
        [manager defaultSetup];
    });
    return manager;
}
- (void)defaultSetup {
    
}



#pragma mark -

+ (NSArray<WLFingerPrint *> *)fingerPrintList {
    return @[
         [WLFingerPrint withName:@"左手 - 大拇指"],
         [WLFingerPrint withName:@"右手 - 中指"],
         [WLFingerPrint withName:@"左脚 - 拇指"],
    ];
}
+ (NSArray<WLPassword *> *)passwordList {
    return @[
         [WLPassword withName:@"密码1" password:@"111111"],
         [WLPassword withName:@"密码2" password:@"222222"],
         [WLPassword withName:@"密码3" password:@"333333"],
    ];
}

@end
