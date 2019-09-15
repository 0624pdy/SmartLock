//
//  NSDictionary+WLSafe.m
//  MyCategory
//
//  Created by MG_PDY on 2019/4/1.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSDictionary+WLSafe.h"

@implementation NSDictionary (WLSafe)

- (id)dy_objForKey:(NSString *)key {
    if (key) {
        [self objectForKey:key];
    }
    return nil;
}

@end






@implementation NSMutableDictionary (WLSafe)

- (void)dy_setObj:(id)obj forKey:(NSString *)key {
    if (key) {
        [self setObject:obj forKey:key];
    }
}
- (void)dy_setObj:(id)obj ifExistsKey:(NSString *)key {
    if (key && [self.allKeys containsObject:key]) {
        [self setObject:obj forKey:key];
    }
}

- (void)dy_removeObjForKey:(NSString *)key {
    if (key) {
        [self removeObjectForKey:key];
    }
}

@end
