//
//  WLFingerPrintListVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLFingerPrintListVC.h"

#import "WLAddFingerPrintVC.h"      //添加指纹
#import "WLFingerPrintDetailVC.h"   //指纹详情

@interface WLFingerPrintListVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,strong) NSMutableArray *sec;

@end

@implementation WLFingerPrintListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"开门指纹";
    
    _listView.backgroundColor   = WLColor_245;
    _listView.separatorColor    = WLColor_(225);
    [_listView mg_registerCellNibs:@[ WLCommonTbCell.dy_name ]];
    self.tableView = _listView;
    

    WeakSelf(weakSelf)
    _btn.btnTitle = @"添加";
    _btn.block_click = ^(id sender) {
        ///TODO: 添加
        WLAddFingerPrintVC *vc = [[WLAddFingerPrintVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.sec.count == 0) {
        [self loadDatas];
    } else {
        [_listView reloadData];
    }
}
- (void)dealloc {
    _btn.block_click = nil;
}




#pragma mark - Datas

- (void)loadDatas {
    NSArray *datas = @[
                           [WLFingerPrint withName:@"左手 - 大拇指"],
                           [WLFingerPrint withName:@"右手 - 中指"],
                           [WLFingerPrint withName:@"左脚 - 拇指"],
                      ];
    [self.sec wl_addObjs:datas];
    
    [_listView reloadData];
}




#pragma mark -

- (NSMutableArray *)sec {
    if (_sec == nil) {
        _sec = @[].mutableCopy;
        _sec.headerHeight = 10;
        _sec.footerHeight = 10;
        _sec.dy_rowHeight = 50;
        _sec.dy_cellIden = WLCommonTbCell.dy_name;
        
        [self.rootDatas addObject:_sec];
    }
    return _sec;
}




#pragma mark -

- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell_ model:(NSObject *)model_ inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    WLCommonTbCell *cell = (WLCommonTbCell *)cell_;
    
    WLFingerPrint *model = (WLFingerPrint *)model_;
    
    cell.wl_accessoryType   = WLCellAccessoryType_Arrow;
    cell.lbl_left.text      = model.name;
}
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
    WLFingerPrint *model = (WLFingerPrint *)row;
    
    WLFingerPrintDetailVC *vc = [[WLFingerPrintDetailVC alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
