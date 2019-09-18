//
//  WLSettingsVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLSettingsVC.h"

#import "WLSettingsVC_Volumn.h" //设置 - 音量
#import "WLSettingsVC_Shake.h"  //设置 - 震动

@interface WLSettingsVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;


@property (nonatomic,strong) NSObject *row_volumn;
@property (nonatomic,strong) NSObject *row_shake;
@property (nonatomic,strong) NSObject *row_power;

@end

@implementation WLSettingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"设置";
    
    _listView.backgroundColor = WLColor_245;
    _listView.separatorColor = WLColor_(225);
    [_listView mg_registerCellNibs:@[ WLCommonTbCell.dy_name ]];
    self.tableView = _listView;
    
    
    //数据源
    _row_volumn = [NSObject objWithTitle:@"音量" desc:nil actionIndex:0];
    _row_volumn.dy_Integer = WLCellAccessoryType_Arrow;
    _row_shake = [NSObject objWithTitle:@"震动" desc:nil actionIndex:1];
    _row_shake.dy_Integer = WLCellAccessoryType_Arrow;
    _row_power = [NSObject objWithTitle:@"电量" desc:nil actionIndex:2];
    _row_power.dy_Integer = WLCellAccessoryType_None;
    
    NSArray *sec_0 = @[ _row_volumn, _row_shake, _row_power ];
    sec_0.headerHeight = 10;
    sec_0.footerHeight = 10;
    sec_0.dy_rowHeight = 50;
    sec_0.dy_cellIden = WLCommonTbCell.dy_name;
    [self.rootDatas addObject:sec_0];
    
    
    //
    _row_volumn.dy_desc = WLSettingsManager.volumn;
    _row_shake.dy_desc  = WLSettingsManager.shake;
    _row_power.dy_desc  = @"高电量";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _row_volumn.dy_desc = WLSettingsManager.volumn;
    _row_shake.dy_desc  = WLSettingsManager.shake;
    [_listView reloadData];
}




#pragma mark -

- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell_ model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    WLCommonTbCell *cell = (WLCommonTbCell *)cell_;

    cell.wl_accessoryType   = model.dy_Integer;
    cell.lbl_left.text      = model.dy_title;
    cell.lbl_right.text     = model.dy_desc;
}
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
    if (row.dy_index == 0) {
        //音量
        WLSettingsVC_Volumn *vc = [[WLSettingsVC_Volumn alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (row.dy_index == 1) {
        //震动
        WLSettingsVC_Shake *vc = [[WLSettingsVC_Shake alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
