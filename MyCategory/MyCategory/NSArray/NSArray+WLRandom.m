//
//  NSArray+WLRandom.m
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSArray+WLRandom.h"

@implementation NSArray (WLRandom)

- (id)wl_randomObj {
    if (self.count == 0) {
        return nil;
    }
    return [self objectAtIndex:(arc4random() % self.count)];
}

@end
