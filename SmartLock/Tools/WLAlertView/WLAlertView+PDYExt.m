//
//  WLAlertView+PDYExt.m
//  PDYDemos
//
//  Created by MG_PDY on 2019/4/1.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAlertView+PDYExt.h"

@implementation WLAlertView (PDYExt)


#pragma mark - 显示【文本】

+ (void)showText:(NSString *)text {
    [WLAlertView showWithStyle:WLAlertStyle_TxtOnly image:nil text:text customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showText:(NSString *)text dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_TxtOnly image:nil text:text customView:nil size:CGSizeZero dismissDelay:delay];
}


#pragma mark - 显示【富文本】

+ (void)showAttributedText:(NSAttributedString *)attrText {
    [WLAlertView showWithStyle:WLAlertStyle_AttrTxt image:nil text:attrText customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showAttributedText:(NSAttributedString *)attrText dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_AttrTxt image:nil text:attrText customView:nil size:CGSizeZero dismissDelay:delay];
}


#pragma mark - 显示【活动指示器】

+ (void)showLoading {
    [WLAlertView showWithStyle:WLAlertStyle_ActOnly image:nil text:nil customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showLoading:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_ActOnly image:nil text:nil customView:nil size:CGSizeZero dismissDelay:delay];
}
+ (void)showLoadingAlways {
    [WLAlertView showWithStyle:WLAlertStyle_ActOnly image:nil text:nil customView:nil size:CGSizeZero dismissDelay:-1];
}


#pragma mark - 显示【活动指示器】+【文本】

+ (void)showLoadingWithText:(NSString *)text {
    [WLAlertView showWithStyle:WLAlertStyle_ActTxt image:nil text:text customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showLoadingWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_ActTxt image:nil text:text customView:nil size:CGSizeZero dismissDelay:delay];
}


#pragma mark - 显示【图片】

+ (void)showImage:(id)image {
    [WLAlertView showWithStyle:WLAlertStyle_ImgOnly image:image text:nil customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showImage:(id)image dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_ImgOnly image:image text:nil customView:nil size:CGSizeZero dismissDelay:delay];
}


#pragma mark - 显示【图片】+【文本】

+ (void)showImage:(id)image text:(NSString *)text {
    [WLAlertView showWithStyle:WLAlertStyle_ImgTxt image:image text:text customView:nil size:CGSizeZero dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showImage:(id)image text:(NSString *)text dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_ImgTxt image:image text:text customView:nil size:CGSizeZero dismissDelay:delay];
}


#pragma mark - 显示【自定义视图】

+ (void)showWithCustomView:(UIView *)customView size:(CGSize)size {
    [WLAlertView showWithStyle:WLAlertStyle_Custom image:nil text:nil customView:customView size:size dismissDelay:WLAlertViewDefaultHideDelay];
}
+ (void)showWithCustomView:(UIView *)customView size:(CGSize)size dismissDelay:(NSTimeInterval)delay {
    [WLAlertView showWithStyle:WLAlertStyle_Custom image:nil text:nil customView:customView size:size dismissDelay:delay];
}


#pragma mark - 关闭

+ (void)dismissAlertView {
    [WLAlertView dismiss];
}

@end
