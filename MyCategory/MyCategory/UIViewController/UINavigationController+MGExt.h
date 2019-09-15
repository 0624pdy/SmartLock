//
//  UINavigationController+MGExt.h
//  CashLoan
//
//  Created by MG_PDY on 2019/3/4.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MGExt)

/**
 *  返回指定名称的视图控制器
 *  @param vcName - 指定的视图控制器名称
 *  @return 存在则返回视图控制器，否则返回 nil;
 */
- (UIViewController *)mg_vcNamed:(NSString *)vcName;

/**
 *  返回到指定名称的视图控制器，如果不存在，可以指定是否返回到根视图控制器
 *  @param vcName       - 视图控制器名称
 *  @param animated     - 是否带动画
 *  @param popToRoot    - 是否返回到根视图控制器
 */
- (void)mg_popToVcNamed:(NSString *)vcName animated:(BOOL)animated popToRootIfNeeded:(BOOL)popToRoot;

/**
 *  移除从 firstVCToPop 开始的所有视图控制器，并显示 vcToPush
 *  @param firstVCToPop - 要移除的视图控制器中的第一个
 *  @param vcToPush     - 要显示的视图控制器
 *  @param animated     - 是否带动画
 */
- (void)mg_popVCsFrom:(UIViewController *)firstVCToPop anPushVC:(UIView *)vcToPush animated:(BOOL)animated;

- (void)mg_popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
