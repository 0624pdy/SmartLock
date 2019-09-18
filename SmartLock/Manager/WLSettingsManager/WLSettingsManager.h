//
//  WLSettingsManager.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLSettingsManager : NSObject

+ (instancetype)sharedManager;


@property (nonatomic,class) NSString *volumn;
@property (nonatomic,class) NSString *shake;

@end
