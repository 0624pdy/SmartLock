//
//  UIViewController+MGExt.m
//  CashLoan
//
//  Created by MG_PDY on 2019/3/2.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UIViewController+MGExt.h"

//#import "MZFormSheetController.h"

#import <objc/runtime.h>
#import "RuntimeProperty.h"

@implementation UIViewController (MGExt)

+ (void)load {
    
    //viewDidLoad
    SEL toSEL = @selector(mg_viewDidLoad);
    Method fromMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method toMethod = class_getInstanceMethod([self class], toSEL);
    if (!class_addMethod([self class], toSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    //viewWillAppear:
    toSEL = @selector(mg_viewWillAppear:);
    fromMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    toMethod = class_getInstanceMethod([self class], toSEL);
    if (!class_addMethod([self class], toSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    //viewDidAppear:
    toSEL = @selector(mg_viewDidAppear:);
    fromMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    toMethod = class_getInstanceMethod([self class], toSEL);
    if (!class_addMethod([self class], toSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    //viewWillDisappear:
    toSEL = @selector(mg_viewWillDisappear:);
    fromMethod = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
    toMethod = class_getInstanceMethod([self class], toSEL);
    if (!class_addMethod([self class], toSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    //viewDidDisappear:
    toSEL = @selector(mg_viewDidDisappear:);
    fromMethod = class_getInstanceMethod([self class], @selector(viewDidDisappear:));
    toMethod = class_getInstanceMethod([self class], toSEL);
    if (!class_addMethod([self class], toSEL, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}



RuntimeProperty_imp_Obj_(block_viewDidLoad, setBlock_viewDidLoad, WLViewDidLoadBlock, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(block_viewWillAppear, setBlock_viewWillAppear, WLViewControllerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(block_viewDidAppear, setBlock_viewDidAppear, WLViewControllerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(block_viewWillDisappear, setBlock_viewWillDisappear, WLViewControllerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(block_viewDidDisappear, setBlock_viewDidDisappear, WLViewControllerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC)

//RuntimeProperty_setter_NonObj_(navBarState, setNavBarState, WLNavBarState)
RuntimeProperty_imp_NonObj_(navBarState, setNavBarState, WLNavBarState)
- (void)setShowNavLine:(BOOL)showNavLine {
    [self.navigationController.navigationBar setShadowImage:(showNavLine ? nil : [UIImage new])];
}


- (void)mg_viewDidLoad {
    [self mg_viewDidLoad];
    
    if (self.block_viewDidLoad) {
        self.block_viewDidLoad(self);
    }
}
- (void)mg_viewWillAppear:(BOOL)animated {
    [self mg_viewWillAppear:animated];
    
//    if (@available(iOS 11.0, *)) {
//        NSLog(@"1⃣️ iOS 11 +");
//    } else {
//        NSLog(@"1⃣️ iOS 10 -");
//    }
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) {
//        NSLog(@"2⃣️ iOS 11 +");
//    } else {
//        NSLog(@"2⃣️ iOS 10 -");
//    }
    
    if (self.navBarState == WLNavBarState_Show) {
        
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.showNavLine = YES;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
    } else if (self.navBarState == WLNavBarState_Hide) {
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
    } else if (self.navBarState == WLNavBarState_Clear) {
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.showNavLine = NO;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
    }
    
    if (self.block_viewWillAppear) {
        self.block_viewWillAppear(self, animated);
    }
}
- (void)mg_viewDidAppear:(BOOL)animated {
    [self mg_viewDidAppear:animated];
    
    if (self.block_viewDidAppear) {
        self.block_viewDidAppear(self, animated);
    }
}
- (void)mg_viewWillDisappear:(BOOL)animated {
    [self mg_viewWillDisappear:animated];
    
    if (self.block_viewWillDisappear) {
        self.block_viewWillDisappear(self, animated);
    }
}
- (void)mg_viewDidDisappear:(BOOL)animated {
    [self mg_viewDidDisappear:animated];
    
    if (self.block_viewDidDisappear) {
        self.block_viewDidDisappear(self, animated);
    }
}

@end





@implementation UIViewController (Alert)

//+ (void)mg_alertVC:(UIViewController *)childVC
//              size:(CGSize)size
//             style:(MZFormSheetTransitionStyle)style
//              inVC:(UIViewController *)parentVC
//        completion:(void (^)(id))completion
//{
//    [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:NO];
//    [[MZFormSheetBackgroundWindow appearance] setBlurRadius:0];
//    [[MZFormSheetBackgroundWindow appearance] setBackgroundColor:RGB(0, 0, 0, 0.7)];
//    
//    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:childVC];
//    
//    formSheet.presentedFormSheetSize = size;
//    formSheet.shouldDismissOnBackgroundViewTap = YES;
//    formSheet.shouldCenterVertically = YES;
//    formSheet.movementWhenKeyboardAppears = MZFormSheetWhenKeyboardAppearsCenterVertically;
//    
//    formSheet.transitionStyle = style;
//    
//    [parentVC mz_presentFormSheetController:formSheet animated:YES completionHandler:^(MZFormSheetController *formSheetController) {
//        if (completion) {
//            completion(nil);
//        }
//    }];
//}
//
//- (void)mg_alertVC:(UIViewController *)childVC
//              size:(CGSize)size
//             style:(MZFormSheetTransitionStyle)style
//        completion:(void (^)(id))completion
//{
//    [UIViewController mg_alertVC:childVC size:size style:style inVC:self completion:completion];
//}
//
//- (void)mg_dismissAlert {
//    [self.formSheetController dismissAnimated:YES completionHandler:nil];
//}

@end
