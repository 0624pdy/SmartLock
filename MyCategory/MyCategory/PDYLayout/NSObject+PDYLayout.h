//
//  NSObject+PDYLayout.h
//  MyProject
//
//  Created by MG_PDY on 2019/3/11.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#import "UITableView+PDYLayout.h"
#import "RuntimeProperty.h"



@interface NSObject (PDYLayout)

@property (class,nonatomic,readonly) NSString *dy_name;

@end




#pragma mark -

@interface NSObject (PDYLayout_Common)

@property (nonatomic,strong) id dy_obj;             //model属性
@property (nonatomic,copy)   NSString *dy_title;    //字符串属性
@property (nonatomic,copy)   NSString *dy_desc;     //字符串属性
@property (nonatomic,copy)   NSString *dy_iden;     //重用标识
@property (nonatomic,assign) NSInteger dy_index;    //数字标识，类似 UIViews 的 tag

@property (nonatomic,assign) BOOL dy_flag;          //预留字段，BOOL属性，通用
@property (nonatomic,assign) BOOL dy_selected;      //预留字段，BOOL属性，是否选中
@property (nonatomic,assign) BOOL dy_active;        //预留字段，BOOL属性，是否激活

+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithObj:(id)obj iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithObj:(id)obj actionIndex:(NSInteger)actionIndex;

- (void)withTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
- (void)withTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex;

@end




#pragma mark -

@interface NSArray (PDYLayout_Section)

@property (nonatomic,copy) NSString *headerTitle;
@property (nonatomic,copy) NSString *footerTitle;

@property (nonatomic,copy) NSString *headerSubtitle;
@property (nonatomic,copy) NSString *footerSubtitle;

@property (nonatomic,copy) NSString *headerIden;
@property (nonatomic,copy) NSString *footerIden;

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIView *footerView;

@property (nonatomic,assign) CGFloat headerHeight;          //tableView
@property (nonatomic,assign) CGFloat footerHeight;          //tableView

@property (nonatomic,assign) CGSize headerSize;             //collectionView
@property (nonatomic,assign) CGSize footerSize;             //collectionView

@property (nonatomic,assign) UIEdgeInsets sectionInsets;    //collectionView
@property (nonatomic,assign) CGFloat itemSpace;             //collectionView
@property (nonatomic,assign) CGFloat lineSpace;             //collectionView

+ (NSMutableArray *)secWithHeaderTitle:(NSString *)headerTitle headerHeight:(CGFloat)headerHeight footerTitle:(NSString *)footerTitle footerHeight:(CGFloat)footerHeight;
+ (NSMutableArray *)secWithHeaderTitle:(NSString *)headerTitle headerHeight:(CGFloat)headerHeight;

+ (NSMutableArray *)secWithHeaderIden:(NSString *)headerIden headerHeight:(CGFloat)headerHeight footerIden:(NSString *)footerIden footerHeight:(CGFloat)footerHeight;
+ (NSMutableArray *)secWithHeaderIden:(NSString *)headerIden headerHeight:(CGFloat)headerHeight;

+ (NSMutableArray *)secWithHeaderView:(UIView *)headerView headerHeight:(CGFloat)headerHeight footerView:(UIView *)footerView footerHeight:(CGFloat)footerHeight;
+ (NSMutableArray *)secWithHeaderView:(UIView *)headerView headerHeight:(CGFloat)headerHeight;

//@property (nonatomic,copy) NSArray * (^dy_setHeaderTitle)(NSString *text);
//@property (nonatomic,copy) NSArray * (^dy_setHeaderIden)(NSString *text);
//@property (nonatomic,copy) NSArray * (^dy_setHeaderView)(UIView *view);
//@property (nonatomic,copy) NSArray * (^dy_setHeaderHeight)(CGFloat height);
//@property (nonatomic,copy) NSArray * (^dy_setHeaderSize)(CGSize size);
//@property (nonatomic,copy) NSArray * (^dy_setSectionInsets)(UIEdgeInsets insets);
//@property (nonatomic,copy) NSArray * (^dy_setItemSpace)(CGFloat space);
//@property (nonatomic,copy) NSArray * (^dy_setLineSpace)(CGFloat space);

@end




#pragma mark -

@interface NSObject (PDYLayout_RowOrItem)

@property (nonatomic,assign) CGFloat dy_rowHeight;

+ (instancetype)rowWithModel:(id)model iden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex;
- (void)withIden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex;

@property (nonatomic,assign) CGSize dy_itemSize;

+ (instancetype)itemWithModel:(id)model iden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex;
- (void)withIden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex;

@end
