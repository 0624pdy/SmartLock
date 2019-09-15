//
//  RuntimeProperty.h
//  MyProject
//
//  Created by MG_PDY on 2019/3/2.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#ifndef RuntimeProperty_h
#define RuntimeProperty_h


#import <objc/runtime.h>


#pragma mark -
///TODO: 定义

#define RuntimeProperty_def_(memoryType, TypeAndName)                           \
                                                                                \
    @property (nonatomic,memoryType) TypeAndName;



#pragma mark -
///TODO: 实现(getter & setter)：对象属性，如：NSString, UIView ......

#define RuntimeProperty_imp_Obj_(getter, setter, Type, memoryType)              \
    \
    RuntimeProperty_getter_Obj_(getter, Type)                                   \
    RuntimeProperty_setter_Obj_(getter, setter, Type, memoryType)

#define RuntimeProperty_getter_Obj_(getter, Type)                               \
    \
    - (Type)getter {                                                            \
        return objc_getAssociatedObject(self, _cmd);                            \
    }

#define RuntimeProperty_setter_Obj_(getter, setter, Type, memoryType)           \
    \
    - (void)setter:(Type)getter {                                               \
        objc_setAssociatedObject(self, @selector(getter), getter, memoryType);  \
    }



#pragma mark -
///TODO: 实现(getter & setter)：非对象属性，如：NSinteger, BOOL, CGPoint, 自定义结构体 ......

#define RuntimeProperty_imp_NonObj_(getter, setter, Type)                       \
                                                                                \
    RuntimeProperty_getter_NonObj_(getter, Type)                                \
    RuntimeProperty_setter_NonObj_(getter, setter, Type)

#define RuntimeProperty_getter_NonObj_(getter, Type)                            \
                                                                                \
    - (Type)getter {                                                            \
                                                                                \
        NSValue *tmpValue = objc_getAssociatedObject(self, _cmd);               \
        Type retValue;                                                          \
                                                                                \
        if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) {        \
            [tmpValue getValue:&retValue size:sizeof(Type)];                    \
        } else {                                                                \
            [tmpValue getValue:&retValue];                                      \
        }                                                                       \
                                                                                \
        return retValue;                                                        \
    }

#define RuntimeProperty_setter_NonObj_(getter, setter, Type)                    \
                                                                                \
    - (void)setter:(Type)getter {                                               \
        NSValue *value = [NSValue value:&getter withObjCType:@encode(Type)];    \
        objc_setAssociatedObject(self, @selector(getter), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);   \
    }



#pragma mark -

#define RuntimeBlockProperty_def_(memoryType, Type, Name, BlockReturnType, BlockName)                      \
                                                                                \
    @property (nonatomic,memoryType) Type Name;                                 \
    @property (nonatomic,copy) BlockReturnType (^BlockName)(Type Name);









#define BlockSetter_runtime_def_(mType, pType, pName, blockName, rType) \
    \
    @property (nonatomic, mType, getter=p##pName, setter=p##blockName:) pType pName; \
    @property (nonatomic, copy, getter=t##pName, setter=t##blockName:) rType (^blockName)(pType pName);

#define BlockSetter_def_(mType, pType, pName, blockName, rType) \
    \
    @property (nonatomic, mType) pType pName; \
    @property (nonatomic, copy) rType (^blockName)(pType pName);

#define BlockSetter_set_(blockName, retType, Type, name, weakSelf) \
    \
    self.blockName = ^ retType (Type name) { \
        weakSelf.name = name; \
        return weakSelf; \
    };


#endif /* RuntimeProperty_h */
