//
//  UITableView+PDYLayout.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PDYLayout)

- (void)mg_registerCellClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerCellNibs:(NSArray<NSString *> *)nibNames;

- (void)mg_registerHeaderClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerHeaderNibs:(NSArray<NSString *> *)nibNames;

- (void)mg_registerFooterClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerFooterNibs:(NSArray<NSString *> *)nibNames;

/**
 *  注册默认视图
 */
- (void)mg_registerDefaultViews;

@property (nonatomic,assign) CGFloat mg_headerHeight;
- (CGFloat)mg_headerHeight UNAVAILABLE_ATTRIBUTE;
@property (nonatomic,assign) CGFloat mg_footerHeight;
- (CGFloat)mg_footerHeight UNAVAILABLE_ATTRIBUTE;

@property (nonatomic,assign) CGFloat mg_estimatedHeight;
- (CGFloat)mg_estimatedHeight UNAVAILABLE_ATTRIBUTE;

@property (nonatomic,assign) BOOL mg_adjustContentInsets;
- (BOOL)mg_adjustContentInsets UNAVAILABLE_ATTRIBUTE;

@end

@interface UITableViewCell (PDYLayout)

@property (nonatomic,strong) id mg_model;

@end




@interface UICollectionView (PDYLayout)

- (void)mg_registerCellClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerCellNibs:(NSArray<NSString *> *)nibNames;

- (void)mg_registerHeaderClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerHeaderNibs:(NSArray<NSString *> *)nibNames;

- (void)mg_registerFooterClasses:(NSArray<NSString *> *)classNames;
- (void)mg_registerFooterNibs:(NSArray<NSString *> *)nibNames;

@end

@interface UICollectionViewCell (PDYLayout)

@property (nonatomic,strong) id mg_model;

@end
