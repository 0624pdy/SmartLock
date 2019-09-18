//
//  WLFingerPrint.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLFingerPrint.h"

@implementation WLFingerPrint

+ (instancetype)withName:(NSString *)name {
    WLFingerPrint *model = [[WLFingerPrint alloc] init];
    
    model.name = name;
    
    return model;
}

@end
