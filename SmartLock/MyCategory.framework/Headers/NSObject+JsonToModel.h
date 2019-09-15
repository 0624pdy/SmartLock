//
//  NSObject+JsonToModel.h
//  MyProject
//
//  Created by MG_PDY on 2019/3/11.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>


#define WL_KeyPairs(str)    str : [str wl_replaceHyphenToUnderline],


@interface NSObject (JsonToModel)

+ (id)objFromJSON:(id)json;
+ (instancetype)modelFromDic:(NSDictionary<NSString *, id> *)dic;
+ (NSArray<id> *)modelsFromArr:(NSArray<NSDictionary *> *)arr;

+ (void)updateModel:(id)obj withDic:(NSDictionary<NSString *, id> *)dic;

@property (nonatomic,readonly) NSDictionary *wl_propertyDic;
@property (nonatomic,readonly) NSArray *wl_propertyKeys;

@end







@interface NSArray (DicToModel)

- (void)convertToModelsWithClass:(Class)aClass;
- (void)convertToModelsWithClassName:(NSString *)className;

@end







@interface NSObject (CheckObj)

/**
 *  是否是合法的json格式
 */
- (BOOL)isValidJSON;
+ (BOOL)isValidJSON:(id)obj;

/**
 *  检查数据类型，返回字符串
 */
+ (NSString *)checkObj:(NSObject *)obj;

+ (BOOL)keepJSON;

@property (nonatomic,class,readonly) NSDictionary *wl_keyPairsToConvert;

@end





@interface NSString (WL_ReplaceSymbol)

- (NSString *)wl_replace:(NSString *)str0 to:(NSString *)str1;
- (NSString *)wl_replaceHyphenToUnderline;

@end
