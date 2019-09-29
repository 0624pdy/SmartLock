//
//  UIView+AddToView.m
//  MyCategory
//
//  Created by MG_PDY on 2019/3/20.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UIView+AddToView.h"

@implementation UIView (AddToView)

- (void)addToView:(UIView *)aView type:(PDYAddViewType)type edgeInsets:(UIEdgeInsets)edgeInsets {
    
    if (aView) {
        
        if (type == PDYAddViewType_Add) {
            [aView addSubview:self];
        } else if (type == PDYAddViewType_Insert) {
            [aView insertSubview:self atIndex:0];
        } else {
            
        }
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_6_0

        self.frame = CGRectMake(
                                0 + edgeInsets.left,
                                0 + edgeInsets.top,
                                aView.frame.size.width - edgeInsets.left - edgeInsets.right,
                                aView.frame.size.height - edgeInsets.top - edgeInsets.bottom
                                );

#elseif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeTop multiplier:1.0 constant:edgeInsets.top]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:edgeInsets.left]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:aView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:edgeInsets.bottom]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:aView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:edgeInsets.right]];
        
        /*
        NSString *hStr = [NSString stringWithFormat:@"H:|-%f-[self]-%f-|", edgeInsets.left, edgeInsets.right];
        NSString *vStr = [NSString stringWithFormat:@"V:|-%f-[self]-%f-|", edgeInsets.top, edgeInsets.bottom];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hStr options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vStr options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)]];
        */
         
#else

        [self setTranslatesAutoresizingMaskIntoConstraints:NO];

        /*
        [NSLayoutConstraint activateConstraints:@[
            [self.topAnchor constraintEqualToAnchor:aView.topAnchor] ,
            [self.leftAnchor constraintEqualToAnchor:aView.leftAnchor],
            [self.bottomAnchor constraintEqualToAnchor:aView.bottomAnchor],
            [self.rightAnchor constraintEqualToAnchor:aView.rightAnchor]
        ]];
        */

        [self.topAnchor     constraintEqualToAnchor:aView.topAnchor    constant:edgeInsets.top].active     = YES;
        [self.leftAnchor    constraintEqualToAnchor:aView.leftAnchor   constant:edgeInsets.left].active    = YES;
        [aView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor  constant:edgeInsets.bottom].active  = YES;
        [aView.rightAnchor  constraintEqualToAnchor:self.rightAnchor   constant:edgeInsets.right].active   = YES;

#endif
    }
}



#pragma mark - Add

- (void)addToView:(UIView *)aView edgeInsets:(UIEdgeInsets)edgeInsets {
    [self addToView:aView type:PDYAddViewType_Add edgeInsets:edgeInsets];
}
- (void)addToView:(UIView *)aView {
    [self addToView:aView edgeInsets:UIEdgeInsetsZero];
}



#pragma mark - Insert

- (void)insertToView:(UIView *)aView edgeInsets:(UIEdgeInsets)edgeInsets {
    [self addToView:aView type:PDYAddViewType_Insert edgeInsets:edgeInsets];
}
- (void)insertToView:(UIView *)aView {
    [self insertToView:aView edgeInsets:UIEdgeInsetsZero];
}

@end
