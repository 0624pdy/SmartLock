//
//  WLFingerPrintDetailVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLFingerPrintDetailVC.h"

#import "WLAddFingerPrintVC.h"          //修改名称
#import "WLAddFingerPrintVC_Step2.h"    //重录指纹

@interface WLFingerPrintDetailVC ()

@property (nonatomic,strong) NSObject *model;

@property (weak, nonatomic) IBOutlet UITableView *listView;

@end

@implementation WLFingerPrintDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _model = (NSObject *)self.dy_obj;
    
    self.navigationItem.title = _model.dy_title;
    
    
    _listView.backgroundColor   = WLColor_245;
    _listView.separatorColor    = WLColor_(225);
    self.tableView = _listView;
    
    NSObject *row_0 = [NSObject objWithTitle:@"修改名称" desc:nil actionIndex:0];
    NSObject *row_1 = [NSObject objWithTitle:@"重录指纹" desc:nil actionIndex:1];
    NSArray *sec_0 = @[ row_0, row_1 ];
    sec_0.headerHeight = 10;
    sec_0.footerHeight = 10;
    sec_0.dy_rowHeight = 50;
    sec_0.dy_cellIden = UITableViewCell.dy_name;
    [self.rootDatas addObject:sec_0];
}




#pragma mark -

- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.font = WLFont_Regular(16);
    cell.textLabel.textColor = WLColor_51;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = model.dy_title;
}
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
    if (row.dy_index == 0) {
        //修改名称
        WLAddFingerPrintVC *vc = [[WLAddFingerPrintVC alloc] init];
        vc.name = row.dy_title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (row.dy_index == 1) {
        //重录指纹
        WLAddFingerPrintVC_Step2 *vc = [[WLAddFingerPrintVC_Step2 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
