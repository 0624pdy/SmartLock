//
//  NSObject+EncodeDecode.m
//  MyCategory
//
//  Created by MG_PDY on 2019/5/23.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSObject+EncodeDecode.h"

#import "NSObject+JsonToModel.h"

@implementation NSObject (EncodeDecode)

- (void)wl_encodeWithCoder:(NSCoder *)aCoder {
    NSArray *keys = self.wl_propertyKeys;
    for (NSString *key in keys) {
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}
- (void)wl_decodeWithDecoder:(NSCoder *)aDecoder {
    NSArray *keys = self.wl_propertyKeys;
    for (NSString *key in keys) {
        [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
    }
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    self = [super init];
//    if (self) {
//        self.type       = [aDecoder decodeObjectForKey:WL_KEY_CusMsg_Type];
//        self.content    = [aDecoder decodeObjectForKey:WL_KEY_CusMsg_Content];
//        self.extra      = [aDecoder decodeObjectForKey:WL_KEY_CusMsg_Extra];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.type      forKey:WL_KEY_CusMsg_Type];
//    [aCoder encodeObject:self.content   forKey:WL_KEY_CusMsg_Content];
//    [aCoder encodeObject:self.extra     forKey:WL_KEY_CusMsg_Extra];
//}

@end
