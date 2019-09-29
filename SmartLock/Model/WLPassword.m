//
//  WLPassword.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLPassword.h"

@implementation WLPassword

+ (instancetype)withName:(NSString *)name password:(NSString *)password {
    WLPassword *model = [[WLPassword alloc] init];
    
    model.name      = name;
    model.password  = password;
    
    return model;
}

@end
