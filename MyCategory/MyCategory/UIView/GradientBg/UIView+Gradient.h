//
//  UIView+Gradient.h
//  CashLoan
//
//  Created by MG_PDY on 2019/3/5.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//




/**
 
 用法:
 
 1.导入头文件：
 #import "UIView+Gradient.h"
 
 2.配置相关参数，并设置初始样式：
 [btn mg_configBg:^DYBgStyle(UIView *theView) {
 
     theView.mg_enabledColor     = UIColor.redColor;
     theView.mg_disabledColor    = UIColor.lightGrayColor;
 
     theView.mg_enabledColors    = @[ UIColor.orangeColor, UIColor.whiteColor ];
     theView.mg_disabledColors   = @[ UIColor.grayColor, UIColor.whiteColor ];
     theView.mg_direction        = DYGradientDirection_Horizolal;
 
     return DYBgStyle_EnabledNormal;
 }];
 
 3.如需改变样式，设置 bgStyle属性 即可：
    btn.bgStyle = (arc4random() % 5);

 */




#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DYBgStyle) {
    
    DYBgStyle_None              = 0,    //无
    
    DYBgStyle_EnabledNormal     = 1,    //纯色可用
    DYBgStyle_DisabledNormal    = 2,    //纯色禁用
    
    DYBgStyle_EnabledGradient   = 3,    //渐变可用
    DYBgStyle_DisabledGradient  = 4,    //渐变禁用
};
typedef NS_ENUM(NSInteger, DYGradientDirection) {
    DYGradientDirection_Horizolal               = 0,    //水平方向 ( 左 - 右 )
    DYGradientDirection_Vertical                = 1,    //垂直方向 ( 上 - 下 )
    DYGradientDirection_TopLeftToBottomRight    = 2,    //左上 - 右下
    DYGradientDirection_TopRightToBottomLeft    = 3,    //右上 - 左下
};
typedef struct {
    CGPoint startPoint;
    CGPoint endPoint;
} DYPoints;

@interface UIView (Gradient)

@property (nonatomic,strong) UIColor *mg_enabledColor;              //可用背景色（纯色）
@property (nonatomic,strong) UIColor *mg_disabledColor;             //禁用背景色（纯色）

@property (nonatomic,strong) NSArray<UIColor *> *mg_enabledColors;  //可用背景色（渐变）
@property (nonatomic,strong) NSArray<UIColor *> *mg_disabledColors; //禁用背景色（渐变）

@property (nonatomic,strong) NSArray *mg_locations;                 //渐变位置
@property (nonatomic,assign) DYGradientDirection mg_direction;      //渐变方向
@property (nonatomic,assign) CGPoint mg_startPoint;                 //渐变方向起点
@property (nonatomic,assign) CGPoint mg_endPoint;                   //渐变方向终点

@property (nonatomic,assign) DYBgStyle bgStyle;                     //背景风格

/**
 *  配置背景相关参数，并设置背景样式
 *  @param config - 在该代码块中配置相关参数，并返回出事样式
 */
- (void)mg_configBg:(DYBgStyle(^)(UIView *theView))config;

/**
 *  直接设置渐变色和渐变方向
 *  @param colors    - 渐变的颜色
 *  @param direction - 渐变方向
 */
- (void)mg_setGradientColors:(NSArray<UIColor *> *)colors direction:(DYGradientDirection)direction;

@end

@interface UILabel (Gradient)

@end

@interface UIImageView (Gradient)

@end
