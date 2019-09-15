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
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action_tap:)]];
}
- (void)action_tap:(UITapGestureRecognizer *)tap {
    if (_block_click) {
        _block_click(self.tag);
    }
}
- (void)setICON:(NSString *)icon title:(NSString *)title tag:(NSInteger)tag action:(void (^)(NSInteger))action {
    _imgView.image = [UIImage imageNamed:icon];
    _lbl_title.text = title;
    self.tag = tag;
    _block_click = action;
}

@end
