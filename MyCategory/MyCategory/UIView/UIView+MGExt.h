//
//  UIView+MGExt.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+AddToView.h"        //添加视图
#import "UIView+LoadXibFromXib.h"   //xib中加载xib
#import "UIView+Gradient.h"         //渐变背景

@interface UIView (MGExt)


/**
 *  创建view
 *  @param frame    - 位置大小
 *  @param bgColor  - 背景色，nil 则默认为 UIColor.clearColor
 */
+ (instancetype)viewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor;
/**
 *  创建view
 *  @param size     - 长宽
 *  @param bgColor  - 背景色，nil 则默认为 UIColor.clearColor
 */
+ (instancetype)viewWithSize:(CGSize)size bgColor:(UIColor *)bgColor;
/**
 *  创建view
 *  @param bgColor  - 背景色，nil 则默认为 UIColor.clearColor
 */
+ (instancetype)viewWithBgColor:(UIColor *)bgColor;


@property (nonatomic,assign)            CGFloat dy_X;           //X
@property (nonatomic,assign)            CGFloat dy_Y;           //Y
@property (nonatomic,assign)            CGFloat dy_W;           //宽
@property (nonatomic,assign)            CGFloat dy_H;           //高

@property (nonatomic,assign)            CGFloat dy_T;           //最小Y，上
@property (nonatomic,assign)            CGFloat dy_L;           //最小X，左
@property (nonatomic,assign,readonly)   CGFloat dy_B;           //最大Y，下
@property (nonatomic,assign,readonly)   CGFloat dy_R;           //最大X，右

@property (nonatomic,assign,readonly)   CGFloat dy_cX;          //中心点X
@property (nonatomic,assign,readonly)   CGFloat dy_cY;          //中心点Y

@property (nonatomic,assign,readonly)   CGPoint dy_origin;      //原点坐标

@property (nonatomic,assign,readonly)   CGPoint dy_topLeft;     //左上角坐标
@property (nonatomic,assign,readonly)   CGPoint dy_topRight;    //右上角坐标
@property (nonatomic,assign,readonly)   CGPoint dy_center;      //中心点坐标
@property (nonatomic,assign,readonly)   CGPoint dy_bottomLeft;  //左下角坐标
@property (nonatomic,assign,readonly)   CGPoint dy_bottomRight; //右下角坐标

@property (nonatomic,assign,readonly)   CGSize  dy_size;        //宽高尺寸

@property (nonatomic,assign,readonly)   CGFloat dy_rateWH;      //宽高比
@property (nonatomic,assign,readonly)   CGFloat dy_rateHW;      //高宽比



@property (nonatomic,assign) CGFloat dy_cornerRadius;           //圆角半径
@property (nonatomic,assign) CGFloat dy_borderWidth_white;      //白色边框，宽度1
@property (nonatomic,assign) CGFloat dy_borderWidth_black;      //黑色边框，宽度1

/**
 *  显示阴影
 *  @param color    - 阴影颜色
 *  @param offset   - 阴影偏移
 *  @param radius   - 阴影半径
 *  @param opacity  - 阴影的不透明度
 */
- (void)showShadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity;

@end





@interface UIView (LogSubviews)

+ (void)logView:(UIView *)view level:(NSInteger)level;

- (void)logSubviews;

+ (void)enumerateSubviewsOfView:(UIView *)view
                          level:(NSInteger)level
                       callback:(void(^)(UIView *view, NSInteger level))callback;

@end
