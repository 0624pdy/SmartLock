//
//  NSDictionary+WLSafe.h
//  MyCategory
//
//  Created by MG_PDY on 2019/4/1.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WLSafe)

- (id)dy_objForKey:(NSString *)key;

@end





@interface NSMutableDictionary (WLSafe)

- (void)dy_setObj:(id)obj forKey:(NSString *)key;
- (void)dy_setObj:(id)obj ifExistsKey:(NSString *)key;

- (void)dy_removeObjForKey:(NSString *)key;

@end
