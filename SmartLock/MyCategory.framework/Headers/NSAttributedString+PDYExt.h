//
//  NSAttributedString+PDYExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/5/14.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WLStringAttrs;

@interface NSAttributedString (PDYExt)

+ (instancetype)wl_attrWithString:(NSString *)str
                             font:(UIFont *)font
                            color:(UIColor *)color
                           others:(NSArray<WLStringAttrs *> *)others;

@end




@interface NSString (PDYAttrExt)

- (NSAttributedString *)wl_attrWithFont:(UIFont *)font
                                  color:(UIColor *)color
                                 others:(NSArray<WLStringAttrs *> *)others;

- (WLStringAttrs *)attrsWithFont:(UIFont *)font color:(UIColor *)color;

@end

@interface WLStringAttrs : NSObject

@property (nonatomic,copy) NSString *string;

@property (nonatomic,strong) UIFont *dy_font;
@property (nonatomic,strong) UIColor *dy_color;

@end





#pragma mark -

@interface UILabel (LineSpace)

@property (nonatomic,assign) CGFloat wl_lineSpace;      //行间距
@property (nonatomic,assign) CGFloat wl_paragraphSpace; //段距
- (CGFloat)wl_lineSpace UNAVAILABLE_ATTRIBUTE;
- (CGFloat)wl_paragraphSpace UNAVAILABLE_ATTRIBUTE;

/**
 *  设置行间距、段距
 *  @note 如果字符串中包含换行符\n，则视为多段，此时 段距paragraphSpace 生效
 *  @param lineSpace        - 行间距
 *  @param paragraphSpace   - 段距
 */
- (void)wl_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace;

@end
