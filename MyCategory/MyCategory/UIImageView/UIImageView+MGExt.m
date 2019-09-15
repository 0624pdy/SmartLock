//
//  UIImageView+MGExt.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UIImageView+MGExt.h"

#import <objc/runtime.h>
//#import "UIImageView+WebCache.h"

@implementation UIImageView (MGExt)

+ (instancetype)withImage:(id)image contentMode:(UIViewContentMode)contentMode {
    UIImageView *imgView = [[UIImageView alloc] init];
    
    imgView.mg_image    = image;
    imgView.contentMode = contentMode;
    
    return imgView;
}




- (id)mg_image {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setMg_image:(id)mg_image {
    objc_setAssociatedObject(self, @selector(mg_image), mg_image, OBJC_ASSOCIATION_RETAIN);
    
    if ([mg_image isKindOfClass:[UIImage class]]) {
        self.image = (UIImage *)mg_image;
    } else if ([mg_image isKindOfClass:[NSURL class]]) {
//        [self sd_setImageWithURL:(NSURL *)mg_image placeholderImage:nil];
    } else if ([mg_image isKindOfClass:[NSData class]]) {
        self.image = [UIImage imageWithData:(NSData *)mg_image];
    } else if ([mg_image isKindOfClass:[NSString class]]) {
        
        NSString *imgStr = (NSString *)mg_image;
        
        if ([imgStr hasPrefix:@"http"]) {
//            [self sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:nil];
        } else {
            self.image = [UIImage imageNamed:imgStr];
        }
    } else {
        
    }
}

@end


