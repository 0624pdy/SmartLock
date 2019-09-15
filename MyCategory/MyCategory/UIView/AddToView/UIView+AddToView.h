//
//  UIView+AddToView.h
//  MyCategory
//
//  Created by MG_PDY on 2019/3/20.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PDYAddViewType) {
    PDYAddViewType_Add      = 0,
    PDYAddViewType_Default  = PDYAddViewType_Add,
    
    PDYAddViewType_Insert   = 1,
};

@interface UIView (AddToView)

/**
 *  即 [aView addSubview:self];
 *  @param aView        - 父视图
 *  @param edgeInsets   - 四周边距
 */
- (void)addToView:(UIView *)aView edgeInsets:(UIEdgeInsets)edgeInsets;
- (void)addToView:(UIView *)aView;

/**
 *  即 [aView insertSubview:self atIndex:0];
 *  @param aView        - 父视图
 *  @param edgeInsets   - 四周边距
 */
- (void)insertToView:(UIView *)aView edgeInsets:(UIEdgeInsets)edgeInsets;
- (void)insertToView:(UIView *)aView;

@end
