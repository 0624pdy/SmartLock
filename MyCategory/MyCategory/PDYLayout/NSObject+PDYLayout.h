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

@property (class,nonatomic,readonly) NSString *dy_name;         //类名字符串

@end




#pragma mark -

@interface NSObject (PDYLayout_Common)

@property (nonatomic,strong) id dy_obj;                         //model属性

@property (nonatomic,copy)   NSString *dy_imageName;            //预留字段，图片名称
@property (nonatomic,strong) UIImage  *dy_image;                //预留字段，图片
@property (nonatomic,copy)   NSString *dy_imageURL;             //预留字段，NSString图片地址

@property (nonatomic,copy)   NSString *dy_title;                //预留字段，标题
@property (nonatomic,copy)   NSString *dy_subtitle;             //预留字段，副标题
@property (nonatomic,copy)   NSString *dy_desc;                 //预留字段，描述

@property (nonatomic,copy)   NSString *dy_iden;                 //预留字段，重用标识
@property (nonatomic,copy)   NSString *dy_cellIden;             //预留字段，cell重用标识
@property (nonatomic,copy)   NSString *dy_cellIden_1;           //预留字段，cell重用标识1

@property (nonatomic,copy)   NSString *dy_headerIden;           //预留字段，header重用标识
@property (nonatomic,copy)   NSString *dy_headerIden_1;         //预留字段，header重用标识1

@property (nonatomic,copy)   NSString *dy_footerIden;           //预留字段，footer重用标识
@property (nonatomic,copy)   NSString *dy_footerIden_1;         //预留字段，footer重用标识1

@property (nonatomic,strong) NSMutableArray *dy_selectedArray;  //预留字段，选中的对象(多个)
@property (nonatomic,strong) NSMutableArray *dy_selectedDic;    //预留字段，选中的对象(多个)
@property (nonatomic,strong) id dy_selectedObj;                 //预留字段，选中的对象(单个)
@property (nonatomic,strong) id dy_emptyObj;                    //预留字段，空项
@property (nonatomic,strong) id dy_addItem;                     //预留字段，添加项

@property (nonatomic,assign) NSInteger dy_index;                //数字标识，类似 UIViews 的 tag
@property (nonatomic,assign) NSInteger dy_Integer;              //预留字段，NSInteger属性，通用
@property (nonatomic,assign) int dy_int;                        //预留字段，int属性，通用

@property (nonatomic,assign) BOOL dy_flag;                      //预留字段，BOOL属性，通用
@property (nonatomic,assign) BOOL dy_selected;                  //预留字段，BOOL属性，是否选中
@property (nonatomic,assign) BOOL dy_active;                    //预留字段，BOOL属性，是否激活
@property (nonatomic,assign) BOOL dy_bool0;                     //预留字段，BOOL属性
@property (nonatomic,assign) BOOL dy_bool1;                     //预留字段，BOOL属性
@property (nonatomic,assign) BOOL dy_bool2;                     //预留字段，BOOL属性

+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithObj:(id)obj iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
+ (instancetype)objWithObj:(id)obj actionIndex:(NSInteger)actionIndex;

- (void)withTitle:(NSString *)title desc:(NSString *)desc iden:(NSString *)iden actionIndex:(NSInteger)actionIndex;
- (void)withTitle:(NSString *)title desc:(NSString *)desc actionIndex:(NSInteger)actionIndex;

+ (instancetype)objWithImage:(id)image title:(NSString *)title index:(NSInteger)index;
- (void)withImage:(id)image title:(NSString *)title index:(NSInteger)index;

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

@property (nonatomic,assign) CGFloat dy_rowHeight;              //tableView - cell - 行高

+ (instancetype)rowWithModel:(id)model iden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex;
- (void)withIden:(NSString *)iden height:(CGFloat)height actionIndex:(NSInteger)actionInex;

@property (nonatomic,assign) CGSize dy_itemSize;                //collectionView - cell - itemSize

+ (instancetype)itemWithModel:(id)model iden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex;
- (void)withIden:(NSString *)iden size:(CGSize)size actionIndex:(NSInteger)actionInex;

@end
