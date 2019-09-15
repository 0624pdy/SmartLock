//
//  UIViewController+MGExt.h
//  CashLoan
//
//  Created by MG_PDY on 2019/3/2.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "MZFormSheetTransition.h"


typedef NS_ENUM(NSInteger, WLNavBarState) {
    WLNavBarState_Original  = 0,    //保持原样，不变
    WLNavBarState_Show      = 1,    //显示
    WLNavBarState_Hide      = 2,    //隐藏
    WLNavBarState_Clear     = 3,    //透明背景
};


typedef void(^WLViewDidLoadBlock) (UIViewController *theVC);
typedef void(^WLViewControllerBlock) (UIViewController *theVC, BOOL animated);

@interface UIViewController (MGExt)

@property (nonatomic,copy) WLViewDidLoadBlock block_viewDidLoad;

@property (nonatomic,copy) WLViewControllerBlock block_viewWillAppear;
@property (nonatomic,copy) WLViewControllerBlock block_viewDidAppear;
@property (nonatomic,copy) WLViewControllerBlock block_viewWillDisappear;
@property (nonatomic,copy) WLViewControllerBlock block_viewDidDisappear;

@property (nonatomic,assign) WLNavBarState navBarState;

@property (nonatomic,assign) BOOL showNavLine;
- (BOOL)showNavLine UNAVAILABLE_ATTRIBUTE;

@end






@interface UIViewController (Alert)

//+ (void)mg_alertVC:(UIViewController *)childVC
//              size:(CGSize)size
//             style:(MZFormSheetTransitionStyle)style
//              inVC:(UIViewController *)parentVC
//        completion:(void(^)(id obj))completion;
//
//- (void)mg_alertVC:(UIViewController *)childVC
//              size:(CGSize)size
//             style:(MZFormSheetTransitionStyle)style
//        completion:(void(^)(id obj))completion;
//
//- (void)mg_dismissAlert;

@end
