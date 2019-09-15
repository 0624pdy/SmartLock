//
//  NSString+WLTextSize.m
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSString+WLTextSize.h"

@implementation NSString (WLTextSize)

- (CGSize)wl_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxW {
    if (font) {
        NSMutableDictionary *attr = [@{} mutableCopy];
        attr[NSFontAttributeName] = font;
        
        CGSize size = [self boundingRectWithSize:CGSizeMake(maxW, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attr
                                         context:nil].size;
        
        return size;
    }
    return CGSizeZero;
}

- (CGSize)wl_sizeWithFont:(UIFont *)font maxHeight:(CGFloat)maxH {
    if (font) {
        NSMutableDictionary *attr = [@{} mutableCopy];
        attr[NSFontAttributeName] = font;
        
        CGSize size = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxH)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attr
                                         context:nil].size;
        
        return size;
    }
    return CGSizeZero;
}

- (CGFloat)wl_heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxW extHeight:(CGFloat)extH {
    CGSize size = [self wl_sizeWithFont:font maxWidth:maxW];
    return (CGSizeEqualToSize(CGSizeZero, size) ? 0 : (size.height + extH));
}
- (CGFloat)wl_widthWithFont:(UIFont *)font maxHeight:(CGFloat)maxH extWidth:(CGFloat)extW {
    CGSize size = [self wl_sizeWithFont:font maxHeight:maxH];
    return (CGSizeEqualToSize(CGSizeZero, size) ? 0 : (size.width + extW));
}

@end





#pragma mark -

@implementation NSAttributedString (WLTextSize)

- (CGSize)wl_sizeWithMaxWidth:(CGFloat)maxW {
    CGSize size = [self boundingRectWithSize:CGSizeMake(maxW, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                     context:nil].size;
    return size;
}

- (CGSize)wl_sizeWithMaxHeight:(CGFloat)maxH {
    CGSize size = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxH)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                     context:nil].size;
    return size;
}

- (CGFloat)wl_heightWithMaxWidth:(CGFloat)maxW extHeight:(CGFloat)extH {
    CGSize size = [self wl_sizeWithMaxWidth:maxW];
    return (CGSizeEqualToSize(CGSizeZero, size) ? 0 : (size.height + extH));
}
- (CGFloat)wl_widthWithMaxHeight:(CGFloat)maxH extWidth:(CGFloat)extW {
    CGSize size = [self wl_sizeWithMaxHeight:maxH];
    return (CGSizeEqualToSize(CGSizeZero, size) ? 0 : (size.width + extW));
}

@end
