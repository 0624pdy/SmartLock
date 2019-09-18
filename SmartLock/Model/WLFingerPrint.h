//
//  WLFingerPrint.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLFingerPrint : NSObject

@property (nonatomic,copy) NSString *name;      //名称
@property (nonatomic,copy) NSString *addTime;   //添加时间

+ (instancetype)withName:(NSString *)name;

@end
