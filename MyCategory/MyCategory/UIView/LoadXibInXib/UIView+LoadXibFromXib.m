//
//  UIView+LoadXibFromXib.m
//  MyProject
//
//  Created by MG_PDY on 2019/3/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UIView+LoadXibFromXib.h"

#import <objc/runtime.h>

@implementation UIView (LoadXibFromXib)

+ (void)load {
    [self wl_exchangeSelector:@selector(awakeAfterUsingCoder:)
                   toSelector:@selector(wl_awakeAfterUsingCoder:)];
}

- (instancetype)wl_viewFormXIB {
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    if (self) {
        
    }
    return self;
}
- (id)wl_awakeAfterUsingCoder:(NSCoder *)aDecoder {
    //必须是UIView
    if ([self isKindOfClass:[UIView class]]) {
        //必须 遵循LoadXibInXibProtocol协议 or tag = 9999
        if ([self.class conformsToProtocol:@protocol(LoadXibInXibProtocol)] || self.tag == 9999) {
            //必须是 占位视图，即无子视图
            if (self.subviews.count == 0) {
                return [self newViewFromXIB];
            }
        }
    }
    return self;
}




#pragma mark -

- (instancetype)newViewFromXIB {
    id newView = [self wl_viewFormXIB];
    [self replaceConstrainsFromSelfToView:newView];
    return newView;
}
- (void)replaceConstrainsFromSelfToView:(UIView *)newView {
    
    //把约束：宽、高、宽高比例 转移到新创建的xib视图上
    //因为代码执行到此处时，self 还未被添加到父视图（ 即 superview = nil ），所以只考虑 self 自身的约束
    
    newView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *consArr  = self.constraints;
    NSLayoutConstraint *newCons = nil;
    
    for (NSLayoutConstraint *cons in consArr) {
        
        //NSLayoutAttributeWidth
        if (cons.firstItem == self && cons.secondItem == nil && cons.firstAttribute == NSLayoutAttributeWidth) {
            newCons = [newView.widthAnchor constraintEqualToConstant:cons.constant];
        }
        //NSLayoutAttributeHeight
        if (cons.firstItem == self && cons.secondItem == nil && cons.firstAttribute == NSLayoutAttributeHeight) {
            newCons = [newView.heightAnchor constraintEqualToConstant:cons.constant];
        }
        //比例
        if (
                cons.firstItem != nil &&
                cons.firstItem == cons.secondItem &&
                (
                    (cons.firstAttribute == NSLayoutAttributeWidth && cons.secondAttribute == NSLayoutAttributeHeight) ||
                    (cons.firstAttribute == NSLayoutAttributeHeight && cons.secondAttribute == NSLayoutAttributeWidth)
                )
           )
        {
            newCons = [newView.widthAnchor constraintEqualToAnchor:newView.heightAnchor multiplier:cons.multiplier];
        }

        if (newCons) {
            newCons.shouldBeArchived = cons.shouldBeArchived;
            newCons.priority = cons.priority;
            
            [newView addConstraint:newCons];
        }
    }
}

@end
