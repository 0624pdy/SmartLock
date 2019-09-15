//
//  WLFingerPrintVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLFingerPrintVC.h"

#import "WLSubmitButton.h"

@interface WLFingerPrintVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;

@end

@implementation WLFingerPrintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"开门指纹";
    
    _listView.backgroundColor = RGB(245, 245, 245);
    _listView.separatorColor = WLColor_(225);
    self.tableView = _listView;
    
    NSObject *row_0 = [NSObject objWithTitle:@"指纹名称1" desc:nil actionIndex:0];
    NSObject *row_1 = [NSObject objWithTitle:@"指纹名称1" desc:nil actionIndex:1];
    NSArray *sec_0 = @[ row_0, row_1 ];
    sec_0.headerHeight = 10;
    sec_0.footerHeight = 10;
    sec_0.dy_rowHeight = 50;
    sec_0.dy_cellIden = UITableViewCell.dy_name;
    [self.rootDatas addObject:sec_0];
    
    _btn.btnTitle = @"添加";
    _btn.block_click = ^(id sender) {
        ///TODO: 添加
        NSLog(@"添加指纹");
    };
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
    
}

@end
