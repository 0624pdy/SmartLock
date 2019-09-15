//
//  NSObject+PDYLayout.m
//  MyProject
//
//  Created by MG_PDY on 2019/3/11.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "NSObject+PDYLayout.h"

@implementation NSObject (PDYLayout)

+ (NSString *)dy_name {
    return NSStringFromClass([self class]);
}

@end





@implementation NSObject (PDYLayout_Common)

RuntimeProperty_imp_Obj_(dy_obj, setDy_obj, id, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(dy_title, setDy_title, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(dy_desc, setDy_desc, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(dy_iden, setDy_iden, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_NonObj_(dy_index, setDy_index, NSInteger)

RuntimeProperty_imp_NonObj_(dy_flag, setDy_flag, BOOL)
RuntimeProperty_imp_NonObj_(dy_selected, setDy_selected, BOOL)
RuntimeProperty_imp_NonObj_(dy_active, setDy_active, BOOL)

+ (instancetype)pri_objWithModel:(id)aModel title:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex {
    NSObject *model = [[NSObject alloc] init];
    
    model.dy_obj    = aModel;
    model.dy_title  = title;
    model.dy_desc   = desc;
    model.dy_iden   = iden;
    model.dy_index  = actionIndex;
    
    return model;
}
+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex {
    return [self pri_objWithModel:nil title:title desc:desc iden:iden actionIndex:actionIndex];
}
+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex {
    return [self pri_objWithModel:nil title:title desc:desc iden:nil actionIndex:actionIndex];
}
+ (instancetype)objWithObj:(id)obj iden:(NSString *)iden actionIndex:(NSInteger)actionIndex {
    return [self pri_objWithModel:obj title:nil desc:nil iden:iden actionIndex:actionIndex];
}
+ (instancetype)objWithObj:(id)obj actionIndex:(NSInteger)actionIndex {
    return [self pri_objWithModel:obj title:nil desc:nil iden:nil actionIndex:actionIndex];
}

- (void)withTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex {
    self.dy_title  = title;
    self.dy_desc   = desc;
    self.dy_iden   = iden;
    self.dy_index  = actionIndex;
}
- (void)withTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex {
    [self withTitle:title desc:desc iden:nil actionIndex:actionIndex];
}

@end






@implementation NSArray (PDYLayout_Section)

RuntimeProperty_imp_Obj_(headerTitle, setHeaderTitle, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(footerTitle, setFooterTitle, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)

RuntimeProperty_imp_Obj_(headerSubtitle, setHeaderSubtitle, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(footerSubtitle, setFooterSubtitle, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)

RuntimeProperty_imp_Obj_(headerIden, setHeaderIden, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)
RuntimeProperty_imp_Obj_(footerIden, setFooterIden, NSString *, OBJC_ASSOCIATION_COPY_NONATOMIC)

RuntimeProperty_imp_Obj_(headerView, setHeaderView, UIView *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(footerView, setFooterView, UIView *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

RuntimeProperty_imp_NonObj_(headerHeight, setHeaderHeight, CGFloat)
RuntimeProperty_imp_NonObj_(footerHeight, setFooterHeight, CGFloat)

RuntimeProperty_imp_NonObj_(headerSize, setHeaderSize, CGSize)
RuntimeProperty_imp_NonObj_(footerSize, setFooterSize, CGSize)

RuntimeProperty_imp_NonObj_(sectionInsets, setSectionInsets, UIEdgeInsets)
RuntimeProperty_imp_NonObj_(itemSpace, setItemSpace, CGFloat)
RuntimeProperty_imp_NonObj_(lineSpace, setLineSpace, CGFloat)


+ (NSMutableArray *)pri_mArr {
    NSMutableArray *arr = [@[] mutableCopy];
    
    [arr pri_initialzeBlocks];
    
    return arr;
}
- (void)pri_setHeaderH:(CGFloat)headerH footerH:(CGFloat)footerH {
    self.headerHeight = MAX(CGFLOAT_MIN, headerH);
    self.footerHeight = MAX(CGFLOAT_MIN, footerH);
}
+ (NSMutableArray *)secWithHeaderTitle:(NSString *)headerTitle headerHeight:(CGFloat)headerHeight footerTitle:(NSString *)footerTitle footerHeight:(CGFloat)footerHeight {
    NSMutableArray *sec = [self pri_mArr];
    
    sec.headerTitle     = headerTitle;
    sec.footerTitle     = footerTitle;
    [sec pri_setHeaderH:headerHeight footerH:footerHeight];
    
    return sec;
}
+ (NSMutableArray *)secWithHeaderTitle:(NSString *)headerTitle headerHeight:(CGFloat)headerHeight {
    return [self secWithHeaderTitle:headerTitle headerHeight:headerHeight footerTitle:nil footerHeight:0];
}
+ (NSMutableArray *)secWithHeaderIden:(NSString *)headerIden headerHeight:(CGFloat)headerHeight footerIden:(NSString *)footerIden footerHeight:(CGFloat)footerHeight {
    NSMutableArray *sec = [self pri_mArr];
    
    sec.headerIden      = headerIden;
    sec.footerIden      = footerIden;
    [sec pri_setHeaderH:headerHeight footerH:footerHeight];
    
    return sec;
}
+ (NSMutableArray *)secWithHeaderIden:(NSString *)headerIden headerHeight:(CGFloat)headerHeight {
    return [self secWithHeaderIden:headerIden headerHeight:headerHeight footerIden:nil footerHeight:0];
}
+ (NSMutableArray *)secWithHeaderView:(UIView *)headerView headerHeight:(CGFloat)headerHeight footerView:(UIView *)footerView footerHeight:(CGFloat)footerHeight {
    NSMutableArray *sec = [self pri_mArr];
    
    sec.headerView      = headerView;
    sec.footerView      = footerView;
    [sec pri_setHeaderH:headerHeight footerH:footerHeight];
    
    return sec;
}
+ (NSMutableArray *)secWithHeaderView:(UIView *)headerView headerHeight:(CGFloat)headerHeight {
    return [self secWithHeaderView:headerView headerHeight:headerHeight footerView:nil footerHeight:0];
}


- (void)pri_initialzeBlocks {
    
//    __weak __typeof(self) weakSelf = self;
//
//    self.dy_setHeaderTitle = ^NSArray *(NSString *text) {
//        weakSelf.headerTitle = text;
//        return weakSelf;
//    };
//    self.dy_setHeaderIden = ^NSArray *(NSString *text) {
//        weakSelf.headerIden = text;
//        return weakSelf;
//    };
}

@end






@implementation NSObject (PDYLayout_RowOrItem)

RuntimeProperty_imp_NonObj_(dy_rowHeight, setDy_rowHeight, CGFloat)

RuntimeProperty_imp_NonObj_(dy_itemSize, setDy_itemSize, CGSize)

+ (instancetype)rowWithModel:(id)model iden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex {
    NSObject *row = [[NSObject alloc] init];
    
    row.dy_obj          = model;
    row.dy_iden         = iden;
    row.dy_rowHeight    = height;
    row.dy_index        = actionInex;
    
    return row;
}
- (void)withIden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex {
    self.dy_iden        = iden;
    self.dy_rowHeight   = height;
    self.dy_index       = actionInex;
}

+ (instancetype)itemWithModel:(id)model iden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex {
    NSObject *item = [[NSObject alloc] init];
    
    item.dy_obj         = model;
    item.dy_iden        = iden;
    item.dy_itemSize    = size;
    item.dy_index       = actionInex;
    
    return item;
}
- (void)withIden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex {
    self.dy_iden        = iden;
    self.dy_itemSize    = size;
    self.dy_index       = actionInex;
}

@end
