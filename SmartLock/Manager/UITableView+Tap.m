//
//  UITableView+Tap.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UITableView+Tap.h"

@implementation UITableView (Tap)

- (void (^)(id))block_tapTableView {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setBlock_tapTableView:(void (^)(id))block_tapTableView {
    objc_setAssociatedObject(self, @selector(block_tapTableView), block_tapTableView, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (block_tapTableView) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action_tap:)]];
    }
}
- (void)action_tap:(UITapGestureRecognizer *)tap {
    if (self.block_tapTableView) {
        self.block_tapTableView(nil);
    }
}

@end
