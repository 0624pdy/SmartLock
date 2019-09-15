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
