//
//  NSAttributedString+PDYExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSAttributedString+PDYExt.h"

#import "RuntimeProperty.h"

@implementation NSAttributedString (PDYExt)

+ (instancetype)wl_attrWithString:(NSString *)str font:(UIFont *)font color:(UIColor *)color others:(NSArray<WLStringAttrs *> *)others {
    
    if (str.length == 0) {
        return nil;
    }
    
    NSMutableDictionary *dic = [@{} mutableCopy];
    if (font) {
        dic[NSFontAttributeName] = font;
    }
    if (color) {
        dic[NSForegroundColorAttributeName] = color;
    }
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    
    NSRange range;
    for (WLStringAttrs *attrs in others) {
        range = [str rangeOfString:attrs.string];
        if (range.location != NSNotFound) {
            if (attrs.dy_font) {
                [attrStr addAttribute:NSFontAttributeName value:attrs.dy_font range:range];
            }
            if (attrs.dy_color) {
                [attrStr addAttribute:NSForegroundColorAttributeName value:attrs.dy_color range:range];
            }
        }
    }
    
    return attrStr;
}

@end





@implementation NSString (PDYAttrExt)

- (NSAttributedString *)wl_attrWithFont:(UIFont *)font color:(UIColor *)color others:(NSArray<WLStringAttrs *> *)others {
    return [NSAttributedString wl_attrWithString:self font:font color:color others:others];
}


- (WLStringAttrs *)attrsWithFont:(UIFont *)font color:(UIColor *)color {
    WLStringAttrs *attrs = [[WLStringAttrs alloc] init];
    
    attrs.string    = self;
    attrs.dy_font   = font;
    attrs.dy_color  = color;
    
    return attrs;
}

@end

@implementation WLStringAttrs

@end





#pragma mark -

@implementation UILabel (LineSpace)

- (void)setWl_lineSpace:(CGFloat)wl_lineSpace {
    [self wl_setLineSpace:wl_lineSpace paragraphSpace:-1];
}
- (void)setWl_paragraphSpace:(CGFloat)wl_paragraphSpace {
    [self  wl_setLineSpace:-1 paragraphSpace:wl_paragraphSpace];
}
- (void)wl_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace {
    if (self.attributedText) {
        
        NSMutableAttributedString *attr = [self.attributedText mutableCopy];
        NSRange range = NSMakeRange(0, attr.length);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        if (lineSpace >= 0) {
            style.lineSpacing       = lineSpace;
        }
        if (paragraphSpace >= 0) {
            style.paragraphSpacing  = paragraphSpace;
        }
        [attr addAttribute:NSParagraphStyleAttributeName value:style range:range];
        
        self.text = nil;
        self.attributedText = attr;
        
    } else if (self.text.length > 0) {
        
        NSMutableAttributedString *attr =
        [NSAttributedString wl_attrWithString:self.text
                                         font:self.font
                                        color:self.textColor
                                       others:nil].mutableCopy;
        NSRange range = NSMakeRange(0, attr.length);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        if (lineSpace >= 0) {
            style.lineSpacing       = lineSpace;
        }
        if (paragraphSpace >= 0) {
            style.paragraphSpacing  = paragraphSpace;
        }
        [attr addAttribute:NSParagraphStyleAttributeName value:style range:range];
        
        self.text = nil;
        self.attributedText = attr;
    
    }
}

@end
