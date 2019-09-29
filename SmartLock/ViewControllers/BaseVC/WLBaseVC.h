//
//  WLBaseVC.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MGBaseVCProtocol.h"

#import "NSArray+MGListViewDatasourse.h"

@interface WLBaseVC : UIViewController
<
    UITableViewDataSource, UITableViewDelegate
    , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    , MGBaseVCProtocol
>

@property (nonatomic,strong) NSMutableArray *rootDatas;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,assign) BOOL mg_hideNav;
@property (nonatomic,assign) BOOL wl_hideNavLine;



@property (nonatomic,assign) WLVcType vcType;
- (void)wl_genDefaultValues;

@end
