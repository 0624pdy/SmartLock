//
//  WLAlertView.h
//  PDYDemos
//
//  Created by MG_PDY on 2019/3/25.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WLAlertViewHeader.h"

@interface WLAlertView : UIView

+ (instancetype)sharedView;

@property (nonatomic,assign) WLAlertStyle style;                //风格
@property (nonatomic,assign) WLAlertBgStyle bgStyle;            //背景风格
@property (nonatomic,assign) UIEdgeInsets contentEdgeInsets;    //内容边距，默认：UIEdgeInsetsMake(20, 20, 20, 20)
@property (nonatomic,assign) CGFloat cornerRadius;              //圆角半径


@property (nonatomic,strong) UIView *cus_view;                  //自定义：试图
@property (nonatomic,assign) CGSize cus_size;                   //自定义：视图尺寸

#pragma mark - Show & Dismiss

/**
 *  显示自定义提示视图
 *  @param style        - 风格，相见枚举：WLAlertStyle
 *  @param image        - 图片（ NSString(图片名、地址)、NSURL ）
 *  @param text         - 文本 or 富文本
 *  @param customView   - 自定义视图
 *  @param size         - 自定义视图尺寸
 *  @param delay        - 延迟隐藏的时间
 */
+ (void)showWithStyle:(WLAlertStyle)style
                image:(id)image
                 text:(id)text
           customView:(UIView *)customView
                 size:(CGSize)size
         dismissDelay:(NSTimeInterval)delay;

/**
 *  隐藏自定义提示视图
 */
+ (void)dismiss;

@end
