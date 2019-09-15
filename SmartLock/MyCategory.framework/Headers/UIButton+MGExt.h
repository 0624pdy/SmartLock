//
//  UIButton+MGExt.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MGExt)

+ (instancetype)btnWithImage:(id)image title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor bgImage:(UIImage *)bgImage bgColor:(UIColor *)bgColor;
+ (instancetype)btnWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor;
+ (instancetype)btnWithFont:(UIFont *)font titleColor:(UIColor *)titleColor;

@property (nonatomic,strong) id mg_image;

@end
