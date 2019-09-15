//
//  UIView+MGExt.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UIView+MGExt.h"

@implementation UIView (MGExt)


+ (instancetype)viewWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor {
    UIView *view = [[UIView alloc] init];
    
    view.frame = frame;
    view.backgroundColor = (bgColor ? bgColor : UIColor.clearColor);
    
    return view;
}
+ (instancetype)viewWithSize:(CGSize)size bgColor:(UIColor *)bgColor {
    return [self viewWithFrame:CGRectMake(0, 0, size.width, size.height) bgColor:bgColor];
}
+ (instancetype)viewWithBgColor:(UIColor *)bgColor {
    return [UIView viewWithSize:CGSizeMake(10, 10) bgColor:bgColor];
}


- (CGFloat)dy_X {
    return self.frame.origin.x;
}
- (void)setDy_X:(CGFloat)dy_X {
    CGRect frame = self.frame;
    frame.origin.x = dy_X;
    self.frame = frame;
}

- (CGFloat)dy_Y {
    return self.frame.origin.y;
}
- (void)setDy_Y:(CGFloat)dy_Y {
    CGRect frame = self.frame;
    frame.origin.y = dy_Y;
    self.frame = frame;
}

- (CGFloat)dy_W {
    return self.frame.size.width;
}
- (void)setDy_W:(CGFloat)dy_W {
    CGRect frame = self.frame;
    frame.size.width = dy_W;
    self.frame = frame;
}

- (CGFloat)dy_H {
    return self.frame.size.height;
}
- (void)setDy_H:(CGFloat)dy_H {
    CGRect frame = self.frame;
    frame.size.height = dy_H;
    self.frame = frame;
}

- (CGFloat)dy_T {
    return self.dy_Y;
}
- (void)setDy_T:(CGFloat)dy_T {
    self.dy_Y = dy_T;
}

- (CGFloat)dy_L {
    return self.dy_X;
}
- (void)setDy_L:(CGFloat)dy_L {
    self.dy_X =  dy_L;
}

- (CGFloat)dy_B {
    return (self.frame.origin.y + self.frame.size.height);
}

- (CGFloat)dy_R {
    return (self.frame.origin.x + self.frame.size.width);
}

- (CGFloat)dy_cX {
    return self.center.x;
}
- (CGFloat)dy_cY {
    return self.center.y;
}

- (CGPoint)dy_origin {
    return self.frame.origin;
}
- (void)setDy_origin:(CGPoint)dy_origin {
    CGRect frame = self.frame;
    frame.origin = dy_origin;
    self.frame = frame;
}

- (CGPoint)dy_topLeft {
    return self.dy_origin;
}
- (void)setDy_topLeft:(CGPoint)dy_topLeft {
    self.dy_origin = dy_topLeft;
}

- (CGPoint)dy_topRight {
    return CGPointMake(self.dy_R, self.dy_T);
}

- (CGPoint)dy_center {
    return self.center;
}

- (CGPoint)dy_bottomLeft {
    return CGPointMake(self.dy_L, self.dy_B);
}

- (CGPoint)dy_bottomRight {
    return CGPointMake(self.dy_R, self.dy_B);
}

- (CGSize)dy_size {
    return self.frame.size;
}

- (CGFloat)dy_rateWH {
    if (self.dy_H == 0) {
        return 0;
    }
    return (self.dy_W / self.dy_H);
}
- (CGFloat)dy_rateHW {
    if (self.dy_W == 0) {
        return 0;
    }
    return (self.dy_H / self.dy_W);
}



- (CGFloat)dy_cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setDy_cornerRadius:(CGFloat)dy_cornerRadius {
    if (self.layer.cornerRadius != dy_cornerRadius) {
        self.layer.cornerRadius = dy_cornerRadius;
        //self.layer.masksToBounds = YES;
    }
}

- (CGFloat)dy_borderWidth_white {
    return self.layer.borderWidth;
}
- (void)setDy_borderWidth_white:(CGFloat)dy_borderWidth_white {
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = dy_borderWidth_white;
}
- (CGFloat)dy_borderWidth_black {
    return self.layer.borderWidth;
}
- (void)setDy_borderWidth_black:(CGFloat)dy_borderWidth_black {
    self.layer.borderColor = UIColor.blackColor.CGColor;
    self.layer.borderWidth = dy_borderWidth_black;
}

- (void)showShadowWithColor:(UIColor *)color
                     offset:(CGSize)offset
                     radius:(CGFloat)radius
                    opacity:(CGFloat)opacity
{
    self.layer.shadowColor      = color.CGColor;
    self.layer.shadowOffset     = offset;
    self.layer.shadowRadius     = radius;
    self.layer.shadowOpacity    = opacity;
}

@end





@implementation UIView (LogSubviews)

+ (void)logView:(UIView *)view level:(NSInteger)level {
    
    NSLog(@"level: %@, %@", @(level), view);
    
    for (UIView *v in view.subviews) {
        [self logView:v level:(level + 1)];
    }
}
- (void)logSubviews {
    [UIView logView:self level:0];
}

+ (void)enumerateSubviewsOfView:(UIView *)view level:(NSInteger)level callback:(void(^)(UIView *view, NSInteger level))callback {
    
    NSMutableString *space = [@"" mutableCopy];
    for (NSInteger i = 0; i < level; i ++) {
        [space appendString:@"  "];
    }
    NSLog(@"%@%@level: %@", @(level), space, NSStringFromClass(view.class));
    if (callback) {
        callback(view, level);
    }
    
    for (UIView *v in view.subviews) {
        [UIView enumerateSubviewsOfView:v level:(level + 1) callback:callback];
    }
}

@end
