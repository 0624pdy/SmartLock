//
//  WLSettingsManager.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLSettingsManager.h"

@implementation WLSettingsManager

+ (instancetype)sharedManager {
    static WLSettingsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WLSettingsManager alloc] init];
        [manager defaultSetup];
    });
    return manager;
}
- (void)defaultSetup {
    
}




#pragma mark - Getter & Setter

+ (NSString *)volumn {
    NSString *volumn = [[NSUserDefaults standardUserDefaults] objectForKey:WLKey_Volumn];
    if (volumn == nil) {
        volumn = WLDefault_Volumn;
        self.volumn = volumn;
    }
    return volumn;
}
+ (void)setVolumn:(NSString *)volumn {
    [[NSUserDefaults standardUserDefaults] setObject:volumn forKey:WLKey_Volumn];
}
+ (NSString *)shake {
    NSString *shake = [[NSUserDefaults standardUserDefaults] objectForKey:WLKey_Shake];
    if (shake == nil) {
        shake = WLDefault_Shake;
        self.shake = shake;
    }
    return shake;
}
+ (void)setShake:(NSString *)shake {
    [[NSUserDefaults standardUserDefaults] setObject:shake forKey:WLKey_Shake];
}

@end
