//
//  UIButton+MGExt.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UIButton+MGExt.h"

#import <objc/runtime.h>
//#import "UIButton+WebCache.h"

@implementation UIButton (MGExt)

+ (instancetype)btnWithImage:(id)image title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor bgImage:(UIImage *)bgImage bgColor:(UIColor *)bgColor {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (image) {
        btn.mg_image = image;
    }
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (bgImage) {
        [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    } else if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    
    return btn;
}
+ (instancetype)btnWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor {
    return [self btnWithImage:nil title:title font:font titleColor:titleColor bgImage:nil bgColor:nil];
}
+ (instancetype)btnWithFont:(UIFont *)font titleColor:(UIColor *)titleColor {
    return [self btnWithImage:nil title:nil font:font titleColor:titleColor bgImage:nil bgColor:nil];
}






- (id)mg_image {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setMg_image:(id)mg_image {
    objc_setAssociatedObject(self, @selector(mg_image), mg_image, OBJC_ASSOCIATION_RETAIN);
    
    if ([mg_image isKindOfClass:[UIImage class]]) {
        self.imageView.image = (UIImage *)mg_image;
    } else if ([mg_image isKindOfClass:[NSURL class]]) {
//        [self sd_setImageWithURL:(NSURL *)mg_image forState:UIControlStateNormal];
    } else if ([mg_image isKindOfClass:[NSData class]]) {
        self.imageView.image = [UIImage imageWithData:(NSData *)mg_image];
    } else if ([mg_image isKindOfClass:[NSString class]]) {

        NSString *imgStr = (NSString *)mg_image;

        if ([imgStr hasPrefix:@"http"]) {
//            [self sd_setImageWithURL:[NSURL URLWithString:imgStr] forState:UIControlStateNormal];
        } else {
            self.imageView.image = [UIImage imageNamed:imgStr];
        }
    } else {

    }
}

@end
