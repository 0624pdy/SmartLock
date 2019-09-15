//
//  WLIndexItemView.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexItemView.h"

#import <MyCategory/UIView+MGExt.h>

@implementation WLIndexItemView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.dy_cornerRadius = 6;
    [self showShadowWithColor:RGB(215, 216, 254) offset:CGSizeMake(0, 10) radius:20 opacity:1];
}

@end
