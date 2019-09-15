//
//  UILabel+MGExt.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UILabel+MGExt.h"

@implementation UILabel (MGExt)

+ (instancetype)lblWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color numOfLine:(NSInteger)numOfLine {
    UILabel *lbl = [[UILabel alloc] init];
    
    if (text) {
        lbl.text = text;
    }
    if (font) {
        lbl.font = font;
    }
    if (color) {
        lbl.textColor = color;
    }
    if (numOfLine != 1) {
        lbl.numberOfLines = numOfLine;
    }
    
    return lbl;
}
+ (instancetype)lblWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    return [self lblWithText:text font:font color:color numOfLine:1];
}
+ (instancetype)lblWithFont:(UIFont *)font color:(UIColor *)color {
    return [self lblWithText:nil font:font color:color];
}

@end
