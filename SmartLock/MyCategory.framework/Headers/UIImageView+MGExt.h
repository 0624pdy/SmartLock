//
//  UIImageView+MGExt.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MGExt)

+ (instancetype)withImage:(id)image contentMode:(UIViewContentMode)contentMode;


@property (nonatomic,strong) id mg_image;

@end
