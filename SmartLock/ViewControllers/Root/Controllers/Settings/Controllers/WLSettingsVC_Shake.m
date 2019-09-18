//
//  WLSettingsVC_Shake.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLSettingsVC_Shake.h"

@interface WLSettingsVC_Shake ()

@property (weak, nonatomic) IBOutlet UITableView *listView;

@end

@implementation WLSettingsVC_Shake

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"震动";
    
    _listView.backgroundColor = WLColor_245;
    _listView.separatorColor = WLColor_(225);
    [_listView mg_registerCellNibs:@[ WLCommonTbCell.dy_name ]];
    self.tableView = _listView;
    
    
    //数据源
    NSMutableArray *sec_0 = @[].mutableCopy;
    sec_0.headerHeight = 10;
    sec_0.footerHeight = 10;
    sec_0.dy_rowHeight = 50;
    sec_0.dy_cellIden = WLCommonTbCell.dy_name;
    for (NSInteger i = 0; i < WLItems_Shake.count; i ++) {
        [sec_0 wl_addObj:[NSObject objWithTitle:WLItems_Shake[i] desc:nil actionIndex:i]];
    }
    [self.rootDatas addObject:sec_0];
}




#pragma mark -

- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell_ model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    WLCommonTbCell *cell = (WLCommonTbCell *)cell_;
    
    BOOL selected = [model.dy_title isEqualToString:WLSettingsManager.shake];
    cell.accessoryType  = (selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
    cell.lbl_left.text  = model.dy_title;
}
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
    WLSettingsManager.shake = row.dy_title;
    [tableView reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
