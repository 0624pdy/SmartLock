//
//  NSString+WLTextSize.h
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WLTextSize)

/**
 *  计算文本的尺寸
 *  @param font - 字体
 *  @param maxW - 最大宽度
 */
- (CGSize)wl_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxW;

/**
 *  计算文本的尺寸
 *  @param font - 字体
 *  @param maxH - 最大高度
 */
- (CGSize)wl_sizeWithFont:(UIFont *)font maxHeight:(CGFloat)maxH;

/**
 *  计算文本的高度
 *  @param font - 字体
 *  @param maxW - 最大宽度
 *  @param extH - 预留高度
 */
- (CGFloat)wl_heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxW extHeight:(CGFloat)extH;

/**
 *  计算文本的宽度
 *  @param font - 字体
 *  @param maxH - 最大高度
 *  @param extW - 预留宽度
 */
- (CGFloat)wl_widthWithFont:(UIFont *)font maxHeight:(CGFloat)maxH extWidth:(CGFloat)extW;

@end




#pragma mark -

@interface NSAttributedString (WLTextSize)

/**
 *  计算富文本尺寸
 *  @param maxW - 最大宽度
 */
- (CGSize)wl_sizeWithMaxWidth:(CGFloat)maxW;
/**
 *  计算富文本尺寸
 *  @param maxH - 最大高度
 */
- (CGSize)wl_sizeWithMaxHeight:(CGFloat)maxH;

/**
 *  计算富文本高度
 *  @param maxW - 最大宽度
 *  @param extH - 预留高度
 */
- (CGFloat)wl_heightWithMaxWidth:(CGFloat)maxW extHeight:(CGFloat)extH;
/**
 *  计算富文本宽度
 *  @param maxH - 最大高度
 *  @param extW - 预留宽度
 */
- (CGFloat)wl_widthWithMaxHeight:(CGFloat)maxH extWidth:(CGFloat)extW;

@end
