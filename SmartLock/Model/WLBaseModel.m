//
//  WLBaseModel.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBaseModel.h"

@implementation WLBaseModel

- (NSString *)theName {
    if (
        [self isKindOfClass:[WLFingerPrint class]] ||
        [self isKindOfClass:[WLPassword class]]
    )
    {
        return [self valueForKey:@"name"];
    }
    return @"";
}
- (void)setTheName:(NSString *)theName {
    if (theName) {
        [self setValue:theName forKey:@"name"];
    }
}

@end
