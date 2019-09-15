//
//  UITableView+PDYLayout.m
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UITableView+PDYLayout.h"

#import "RuntimeProperty.h"

@implementation UITableView (PDYLayout)

- (void)mg_registerCellNibs:(NSArray<NSString *> *)nibNames {
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
    }
}
- (void)mg_registerCellClasses:(NSArray<NSString *> *)classNames {
    for (NSString *className in classNames) {
        [self registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
    }
}

- (void)mg_registerHeaderNibs:(NSArray<NSString *> *)nibNames {
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
    }
}
- (void)mg_registerHeaderClasses:(NSArray<NSString *> *)classNames {
    for (NSString *className in classNames) {
        [self registerClass:NSClassFromString(className) forHeaderFooterViewReuseIdentifier:className];
    }
}

- (void)mg_registerFooterNibs:(NSArray<NSString *> *)nibNames {
    [self mg_registerHeaderNibs:nibNames];
}
- (void)mg_registerFooterClasses:(NSArray<NSString *> *)classNames {
    [self mg_registerHeaderClasses:classNames];
}

@end

@implementation UITableViewCell (PDYLayout)

RuntimeProperty_getter_Obj_(mg_model, id)
RuntimeProperty_setter_Obj_(mg_model, setMg_model, id, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

@end






@implementation UICollectionView (PDYLayout)

- (void)mg_registerCellNibs:(NSArray<NSString *> *)nibNames {
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
    }
}
- (void)mg_registerCellClasses:(NSArray<NSString *> *)classNames {
    for (NSString *className in classNames) {
        [self registerClass:NSClassFromString(className) forCellWithReuseIdentifier:className];
    }
}

- (void)mg_registerHeaderNibs:(NSArray<NSString *> *)nibNames {
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:nibName];
    }
}
- (void)mg_registerHeaderClasses:(NSArray<NSString *> *)classNames {
    for (NSString *className in classNames) {
        [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:className];
    }
}

- (void)mg_registerFooterNibs:(NSArray<NSString *> *)nibNames {
    for (NSString *nibName in nibNames) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:nibName];
    }
}
- (void)mg_registerFooterClasses:(NSArray<NSString *> *)classNames {
    for (NSString *className in classNames) {
        [self registerClass:NSClassFromString(className) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:className];
    }
}

@end
