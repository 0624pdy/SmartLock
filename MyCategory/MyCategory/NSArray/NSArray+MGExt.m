//
//  NSArray+MGExt.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "NSArray+MGExt.h"

@implementation NSArray (MGExt)

- (NSInteger)dy_numOfSection {
    NSArray *obj = self.firstObject;
    if (obj) {
        if ([obj isKindOfClass:[NSArray class]]) {
            return self.count;
        } else {
            return 1;
        }
    }
    return 0;
}
- (NSInteger)dy_numOfRowsInSection:(NSInteger )section {
    NSArray *sec = [self wl_objAtIndex:section];
    if ([sec isKindOfClass:[NSArray class]]) {
        return sec.count;
    } else {
        return 0;
    }
}

- (NSArray *)dy_secInSection:(NSInteger)section {
    NSArray *sec = [self wl_objAtIndex:section];
    return sec;
}
- (NSArray *)dy_secAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self wl_objAtIndex:indexPath.section];
    return sec;
}

- (id)dy_modelForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self wl_objAtIndex:indexPath.section];
    id row = [sec wl_objAtIndex:indexPath.row];
    return row;
}
- (id)dy_modelForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self wl_objAtIndex:indexPath.section];
    id item = [sec wl_objAtIndex:indexPath.item];
    return item;
}

@end
