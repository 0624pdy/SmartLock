//
//  WLIndexDetailVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexDetailVC.h"

#import "WLIndexFormVC.h"          //修改名称
#import "WLFingerPrintValidateVC.h"     //重录指纹

@interface WLIndexDetailVC ()
{
    NSString *__navTitle__;
    NSString *__row_0_title__;
    NSString *__row_1_title__;
    WLVcType  __typeFor_row_0__;
    WLVcType  __typeFor_row_1__;
}
@property (weak, nonatomic) IBOutlet UITableView *listView;

@end

@implementation WLIndexDetailVC

- (void)wl_genDefaultValues {
    switch (self.vcType) {
        case WLVcType_Detail_Finger: {
            __navTitle__ = _model.theName;
            __row_0_title__ = @"修改名称";
            __row_1_title__ = @"重录指纹";
            __typeFor_row_0__ = WLVcType_Form_FingerName;
            __typeFor_row_1__ = WLVcType_Validate_Finger;
        }
            break;
        case WLVcType_Detail_Password: {
            __navTitle__ = _model.theName;
            __row_0_title__ = @"修改名称";
            __row_1_title__ = @"修改密码";
            __typeFor_row_0__ = WLVcType_Form_PasswordName;
            __typeFor_row_1__ = WLVcType_Form_Password;
        }
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = __navTitle__;
    
    
    _listView.backgroundColor   = WLColor_245;
    _listView.separatorColor    = WLColor_(225);
    self.tableView = _listView;
    
    
    NSObject *row_0 = [NSObject objWithTitle:__row_0_title__ desc:nil actionIndex:0];
    NSObject *row_1 = [NSObject objWithTitle:__row_1_title__ desc:nil actionIndex:1];
    NSArray *sec_0 = @[ row_0, row_1 ];
    sec_0.headerHeight = 10;
    sec_0.footerHeight = 10;
    sec_0.dy_rowHeight = 50;
    sec_0.dy_cellIden = UITableViewCell.dy_name;
    [self.rootDatas addObject:sec_0];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.title = _model.theName;
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
        //修改[指纹、密码]名称
        WLIndexFormVC *vc = [[WLIndexFormVC alloc] init];
        vc.vcType = __typeFor_row_0__;
        vc.isEdit = YES;
        vc.model = _model;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (row.dy_index == 1) {
        if (self.vcType == WLVcType_Detail_Finger) {
            //重录指纹
            WLFingerPrintValidateVC *vc = [[WLFingerPrintValidateVC alloc] init];
            vc.model = _model;
            vc.optType = (arc4random() % 3);//WLFingerPrintOptType_Reset;
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            //修改密码
            WLIndexFormVC *vc = [[WLIndexFormVC alloc] init];
            vc.vcType = __typeFor_row_1__;
            vc.isEdit = YES;
            vc.model = _model;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
