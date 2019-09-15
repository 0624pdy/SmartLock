//
//  UILabel+MGExt.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MGExt)

/**
 *  创建UILabel
 *  @param text         - 文本
 *  @param font         - 字体
 *  @param color        - 颜色
 *  @param numOfLine    - 行数
 *  @return 实例
 */
+ (instancetype)lblWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color numOfLine:(NSInteger)numOfLine;
+ (instancetype)lblWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;
+ (instancetype)lblWithFont:(UIFont *)font color:(UIColor *)color;

@end
