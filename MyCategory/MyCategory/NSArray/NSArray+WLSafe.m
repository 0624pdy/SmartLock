//
//  NSArray+WLSafe.m
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSArray+WLSafe.h"

@implementation NSArray (WLSafe)

- (id)wl_objAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end





@implementation NSMutableArray (WLSafe)

- (void)wl_addObj:(id)obj {
    if (obj) {
        [self addObject:obj];
    }
}
- (void)wl_removeObj:(id)obj {
    if (obj) {
        [self removeObject:obj];
    }
}

- (void)wl_addObjs:(NSArray *)objs {
    if (objs) {
        [self addObjectsFromArray:objs];
    }
}
- (void)wl_clearAndAddObjs:(NSArray *)objs {
    [self removeAllObjects];
    [self wl_addObjs:objs];
}

@end
