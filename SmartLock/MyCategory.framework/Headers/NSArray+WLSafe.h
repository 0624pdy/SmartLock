//
//  NSArray+WLSafe.h
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WLSafe)

/**
 *  获取指定索引的元素
 *  @param index - 指定索引
 */
- (id)wl_objAtIndex:(NSInteger)index;

@end





@interface NSMutableArray (WLSafe)

/* 添加单个 */
- (void)wl_addObj:(id)obj;
/* 移除单个 */
- (void)wl_removeObj:(id)obj;

/* 添加多个 */
- (void)wl_addObjs:(NSArray *)objs;
/* 移除多个 */
- (void)wl_clearAndAddObjs:(NSArray *)objs;

@end
