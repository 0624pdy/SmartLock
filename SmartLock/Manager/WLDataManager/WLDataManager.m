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

@end
