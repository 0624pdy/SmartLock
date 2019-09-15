//
//  NSString+PDYExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "NSString+TextAttr.h"   //文本属性（字体、大小）
#import "NSString+Encryption.h" //加密相关（MD5、sha1、base64......）
#import "NSString+WLTextSize.h" //计算文本尺寸


@interface NSString (PDYExt)

@property (nonatomic,readonly) NSString *dy_safePhone;  ///脱敏手机号，如：181****1122

@end
