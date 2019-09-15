//
//  UINavigationController+MGExt.m
//  CashLoan
//
//  Created by MG_PDY on 2019/3/4.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UINavigationController+MGExt.h"

@implementation UINavigationController (MGExt)

- (UIViewController *)mg_vcNamed:(NSString *)vcName {
    
    UIViewController *targetVC = nil;
    
    for (UIViewController *vc in self.viewControllers) {
        if ([vc isKindOfClass:NSClassFromString(vcName)]) {
            targetVC = vc;
            break;
        }
    }
    
    return targetVC;
}

- (void)mg_popToVcNamed:(NSString *)vcName animated:(BOOL)animated popToRootIfNeeded:(BOOL)popToRoot {
    
    UIViewController *targetVC = [self mg_vcNamed:vcName];
   
    if (targetVC) {
        [self.navigationController popToViewController:targetVC animated:animated];
    } else {
        if (popToRoot) {
            [self.navigationController popToRootViewControllerAnimated:animated];
        }
    }
}

- (void)mg_popVCsFrom:(UIViewController *)firstVCToPop anPushVC:(UIView *)vcToPush animated:(BOOL)animated {
    
    NSMutableArray *newVCs = [@[] mutableCopy];
    NSArray *oldVCs = self.viewControllers;
    
    if ([oldVCs containsObject:firstVCToPop]) {
        
        NSInteger fromIndex = [oldVCs indexOfObject:firstVCToPop];
        NSInteger index = -1;
        
        for (UIViewController *vc in oldVCs) {
            index = [oldVCs indexOfObject:vc];
            if (index < fromIndex) {
                [newVCs addObject:vc];
            }
        }
    }
    
    if (vcToPush) {
        [newVCs addObject:vcToPush];
    }
    
    [self setViewControllers:newVCs animated:YES];
}

- (void)mg_popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController) {
        [self popToViewController:viewController animated:animated];
    }
}

@end
