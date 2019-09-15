//
//  NSString+WLFilePath.m
//  MyCategory
//
//  Created by MG_PDY on 2019/9/9.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSString+WLFilePath.h"

@implementation NSString (WLFilePath)

+ (NSString *)homeDirectory {
    return  NSHomeDirectory();
}
+ (NSString *)documentDirectory {
    return [self wl_directoryWithType:NSDocumentDirectory];
}
+ (NSString *)libraryDirectory {
    return [self wl_directoryWithType:NSLibraryDirectory];
}
+ (NSString *)cachesDirectory {
    return [self wl_directoryWithType:NSCachesDirectory];
}
+ (NSString *)applicationSupportDirectory {
    return [self wl_directoryWithType:NSApplicationSupportDirectory];
}
+ (NSString *)preferenceDirectory {
    return [self wl_directoryWithType:NSPreferencePanesDirectory];
}
+ (NSString *)temporaryDirectory {
    return NSTemporaryDirectory();
}
+ (NSString *)wl_directoryWithType:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)wl_pathWithComponents:(NSArray<NSString *> *)components {
    NSString *path = [self documentDirectory];
    path = [path stringByAppendingPathComponent:@"userInfo.txt"];
    
    return path;
}

+ (NSString *)wl_documentPathWithComponent:(NSString *)component {
    return [[self documentDirectory] stringByAppendingPathComponent:component];
}

@end
