//
//  UIView+LoadXibFromXib.h
//  MyProject
//
//  Created by MG_PDY on 2019/3/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 ==================================================
 用法：
 ==================================================
 场景：要把 xib A 中的 xib B 加载成 xib C
 ==================================================
 1、把 B 的 custom class 设为 C 的 class
 2、C遵循 LoadXibInXibProtocol协议
 3、B设置 tag 为 9999
 ==================================================
 完事！！！
 注：2、3 任选其一即可
 ==================================================
 */


@protocol LoadXibInXibProtocol <NSObject>

@end


@interface UIView (LoadXibFromXib)

/**
 *  通过xib创建视图
 */
- (instancetype)wl_viewFormXIB NS_REPLACES_RECEIVER;

/**
 *  这是个黑科技
 */
- (id)wl_awakeAfterUsingCoder:(NSCoder *)aDecoder NS_REPLACES_RECEIVER;

@end




/**
 【知识点】
 
 宏定义：NS_REPLACES_RECEIVER
 
 1、放于声明的尾部“;” 之前
 2、这个宏主要为了给编译器标识出这个方法可以像: self = [super init]; 一样使用，并作出合理的内存管理。
 3、参考：http://www.sohu.com/a/86245481_364497
 4、如果一个创建实例的方法未用 NS_REPLACES_RECEIVER 修饰，直接将实例赋值给self，会报错：❌ Cannot assign to 'self' outside of a method in the init family。意思是说，只有在init 这一系列的方法里面才能直接对 self 赋值，如：self = [super init];
 5、举例说明：
    -------------------------------
    【 MyView.h 】
    - (instancetype)newView_1;
    - (instancetype)newView_2 NS_REPLACES_RECEIVER;
    -------------------------------
    【 MyView.m 】
    - (void)init {  //init方法
        self = [super init];
        if (self) {
 
        }
        return self;
    }
    - (instancetype)newView_1 { //报错❌：Cannot assign to 'self' outside of a method in the init family。
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
        if (self) {
 
        }
        return self;
    }
    - (instancetype)newView_2 { //✅
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
        if (self) {
 
        }
        return self;
    }
    -------------------------------

 */
