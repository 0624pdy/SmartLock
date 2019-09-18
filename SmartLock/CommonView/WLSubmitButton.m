//
//  WLSubmitButton.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLSubmitButton.h"

@implementation WLSubmitButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup {
    
    self.dy_cornerRadius = (self.dy_H/2);
    
    [self setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.titleLabel setFont:WLFont_Regular(16)];
    [self mg_configBg:^DYBgStyle(UIView *theView) {
        theView.mg_enabledColors = @[ RGBA(92, 159, 254, 1), RGBA(125, 133, 253, 1) ];
        theView.mg_disabledColor = RGBA(216, 216, 216, 1);
        
        return DYBgStyle_EnabledGradient;
    }];
    
    [self addTarget:self action:@selector(action_click:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)action_click:(id)sender {
    if (_block_click) {
        _block_click(sender);
    }
}
- (void)setBtnTitle:(NSString *)btnTitle {
    [self setTitle:btnTitle forState:UIControlStateNormal];
}

@end
