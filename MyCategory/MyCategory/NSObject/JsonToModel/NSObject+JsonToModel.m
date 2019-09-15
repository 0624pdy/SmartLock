//
//  NSObject+JsonToModel.m
//  MyProject
//
//  Created by MG_PDY on 2019/3/11.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSObject+JsonToModel.h"

#import <objc/runtime.h>


#define ____FCLine____ @"------------------------------------------"


#define FCValidKeys @{\
    @"id"           : @"ID",\
    @"description"  : @"desc",\
    @"signed"       : @"sign",\
    @"operator"     : @"opt",\
    @"default"      : @"isDefault",\
}


@implementation NSObject (JsonToModel)

+ (id)objFromJSON:(id)json {
    if (json) {
        
        // NSDictionary --> Model
        if ([json isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = (NSDictionary *)json;
            id obj = [self new];
            
            [self updateModel:obj withDic:dic];
            
            return obj;
        }
        // NSArray --> Models
        else if ([json isKindOfClass:[NSArray class]]) {
            
            NSArray *dics = (NSArray *)json;
            NSMutableArray *objs = [NSMutableArray array];
            
            id obj = nil;
            for (NSDictionary *dic in dics) {
                //数组中必须是 NSDictionary，且不能是空 NSDictionary
                if ([dic isKindOfClass:[NSDictionary class]] && dic.allKeys.count > 0) {
                    obj = [self objFromJSON:dic];
                    if (obj) {
                        [objs addObject:obj];
                    }
                }
            }
            
            return objs;
        }
        // Others
        else {
            return nil;
        }
    }
    return nil;
}
+ (instancetype)modelFromDic:(NSDictionary<NSString *, id> *)dic {
    return [self objFromJSON:dic];
}
+ (NSArray<id> *)modelsFromArr:(NSArray<NSDictionary *> *)arr {
    return [self objFromJSON:arr];
}

+ (void)updateModel:(id)obj withDic:(NSDictionary<NSString *, id> *)dic{
    
    if (dic.allKeys.count > 0) {
        
        id theObj = obj;
        if (theObj == nil) {
            theObj = [self new];
        }
        
        Class aClass = [self class];
        
        NSString *KEY = nil;    //KVC 中的 KEY，最终要赋值的key
        id VALUE = nil;         //KVC 中的 VALUE，最终要赋值的value，
        id tmpValue = nil;      //临时值，从字典取出的原始值
        objc_property_t aProperty = NULL;
        NSString *attrStr;
        
        for (NSString *key in dic.allKeys) {
            
            
            //原始值
            tmpValue = dic[key];
            
            
            //处理key（ 过【滤FCValidKeys中的系统关键字】【类自身要转换的key】）
            KEY = ([FCValidKeys.allKeys containsObject:key] ? FCValidKeys[key] : key);
            if ([[self wl_keyPairsToConvert].allKeys containsObject:KEY]) {
                KEY = [self wl_keyPairsToConvert][KEY];
            }
            
            aProperty = class_getProperty(aClass, [KEY UTF8String]);
            if (aProperty != NULL) {
                
                attrStr = [NSString stringWithCString:property_getAttributes(aProperty) encoding:NSUTF8StringEncoding];
                
                //Foundation类型的属性
                if ([self isFoundationClass:attrStr]) {
                    //NSArray属性
                    if ([attrStr containsString:@"NSArray"] || [attrStr containsString:@"NSMutableArray"]) {
                        
                        if ([tmpValue isKindOfClass:[NSArray class]]) {
                            VALUE = [NSMutableArray arrayWithArray:tmpValue];
                        } else {
                            VALUE = @[];
                        }
                    }
                    //NSDictionary属性
                    else if ([attrStr containsString:@"NSDictionary"]) {
                        VALUE = tmpValue;
                    }
                    //其他Foundation类型的属性，如：NSURL,NSDate,NSString...  ==> 全部转成 NSString
                    else {
                        VALUE = [self checkObj:tmpValue];
                    }
                }
                //自定义类型的属性
                else {
                    
                    NSString *className = [self classNameFromPropertyAttrStr:attrStr];
                    Class cusClass = NSClassFromString(className);
                    NSDictionary *tmpDic = tmpValue;
                    
                    if (cusClass && [tmpDic isKindOfClass:[NSDictionary class]] && tmpDic.allKeys.count > 0) {
                        VALUE = [cusClass new];
                        [cusClass updateModel:VALUE withDic:tmpDic];
                    } else {
                        
                    }
                }
                
                [theObj setValue:VALUE forKey:KEY];
                
                if ([aClass keepJSON]) {
                    [theObj setValue:dic forKey:@"wl_json"];
                }
            }
            
            
            //⚠️赋值完成置空临时变量，以免下次循环用到本次的值
            tmpValue    = nil;
            KEY         = nil;
            VALUE       = nil;
            attrStr     = nil;
            aProperty   = NULL;
        }
    }
}
+ (NSString *)classNameFromPropertyAttrStr:(NSString *)pAttrStr {
    
    //T@"NSString",C,N,V_userid
    
    NSArray *comps = [pAttrStr componentsSeparatedByString:@","];  //  T@"NSString"    C   N   V_userid
    NSString *tmpStr = [comps firstObject];
    NSString *className = [tmpStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"T@\""]];
    
    return className;
}
+ (BOOL)isFoundationClass:(NSString *)className {
    __block BOOL flag = NO;
    __block NSString *aClass;
    NSArray *classArr = @[
                              @"NSArray",
                              @"NSMutableArray",
                              @"NSDictionary",
                              @"NSURL",
                              @"NSDate",
                              @"NSValue",
                              @"NSData",
                              @"NSError",
                              @"NSString",
                              @"NSAttributedString",
                              @"NSNumber"
                        ];
    [classArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        aClass = (NSString *)obj;
        if ([className containsString:aClass]) {
            flag = YES;
            *stop = YES;
        }
    }];
    return flag;
}


- (NSDictionary *)wl_propertyDic {
    
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    
    unsigned int outCount, i;
    // class:获取哪个类的成员属性列表
    // count:成员属性总数
    // 拷贝属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    //Ivar *ivarList = class_copyIvarList([self class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        const char * char_f = property_getName(property);
        
        // 属性名
        NSString *pName = [NSString stringWithUTF8String:char_f];
        
        if (pName.length > 0) {
            // 属性值
            id propertyValue = [self valueForKey:pName];
            
            if (propertyValue) {
                // 设置KeyValues
                [propsDic setObject:propertyValue forKey:pName];
            }
        }
    }
    // 需手动释放 不受ARC约束
    free(properties);
    
    return propsDic;
}
- (NSArray *)wl_propertyKeys {
    
    NSMutableArray *keys = [@[] mutableCopy];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        const char * char_f = property_getName(property);
        
        // 属性名
        NSString *pName = [NSString stringWithUTF8String:char_f];
        
        if (pName.length > 0) {
            [keys addObject:pName];
        }
    }
    // 需手动释放 不受ARC约束
    free(properties);
    
    return keys;
}

@end




@implementation NSArray (DicToModel)

- (void)convertToModelsWithClass:(Class)aClass {
    
    if ([self isKindOfClass:[NSMutableArray class]] == NO) {
        return;
    }
    
    if (aClass) {
        
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dic in self) {
            if (dic.allKeys.count > 0) {
                id model = [aClass modelFromDic:dic];
                if (model) {
                    [models addObject:model];
                }
            }
            //忽略空字典
            else {
                
            }
        }
        
        [(NSMutableArray *)self removeAllObjects];
        [(NSMutableArray *)self addObjectsFromArray:models];
    }
}
- (void)convertToModelsWithClassName:(NSString *)className {
    Class aClass = NSClassFromString(className);
    [self convertToModelsWithClass:aClass];
}

@end




@implementation NSObject (CheckObj)

- (BOOL)isValidJSON {
    return [NSObject isValidJSON:self];
}
+ (BOOL)isValidJSON:(id)obj {
    if ([obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSArray class]]) {
        return YES;
    }
    return NO;
}

+ (NSString *)checkObj:(NSObject *)obj {
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            return (NSString *)obj;
        } else if ([obj isKindOfClass:[NSNull class]]) {
            return @"";
        } else {
            //return [obj description];
            return [NSString stringWithFormat:@"%@", obj];
        }
    }
    return @"";
}

+ (BOOL)keepJSON {
    return NO;
}

+ (NSDictionary<NSString *, NSString *> *)wl_keyPairsToConvert {
    return nil;
}

@end








@implementation NSString (WL_ReplaceSymbol)

- (NSString *)wl_replace:(NSString *)str0 to:(NSString *)str1 {
    NSString *newStr = [self stringByReplacingOccurrencesOfString:str0 withString:str1];
    return newStr;
}
- (NSString *)wl_replaceHyphenToUnderline {
    return [self wl_replace:@"-" to:@"_"];
}

@end
