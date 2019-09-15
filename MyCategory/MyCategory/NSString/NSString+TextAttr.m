//
//  NSString+TextAttr.m
//  MyCategory
//
//  Created by MG_PDY on 2019/3/19.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSString+TextAttr.h"

#import "RuntimeProperty.h"

@implementation NSString (TextAttr)

RuntimeProperty_imp_Obj_(dy_font, setDy_font, UIFont *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(dy_color, setDy_color, UIColor *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

@end
