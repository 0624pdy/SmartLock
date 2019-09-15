//
//  NSObject+EncodeDecode.h
//  MyCategory
//
//  Created by MG_PDY on 2019/5/23.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EncodeDecode)

- (void)wl_encodeWithCoder:(NSCoder *)aCoder;
- (void)wl_decodeWithDecoder:(NSCoder *)aDecoder;

@end
