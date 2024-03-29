//
//  WLIndexListVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexListVC.h"

#import "WLIndexFormVC.h"       //添加
#import "WLIndexDetailVC.h"     //详情

@interface WLIndexListVC ()
{
    NSString *__navTitle__;
    NSArray *__originDatas__;
    WLVcType __detailType__;
    WLVcType __addType__;
}
@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,strong) NSMutableArray *sec;

@end

@implementation WLIndexListVC

- (void)wl_genDefaultValues {
    switch (self.vcType) {
        case WLVcType_List_FingerPrint: {
            __navTitle__ = @"开门指纹";
            __originDatas__ = WLDataManager.fingerPrintList;
            __detailType__ = WLVcType_Detail_Finger;
            __addType__ = WLVcType_Form_FingerName;
        }
            break;
        case WLVcType_List_Password: {
            __navTitle__ = @"开门密码";
            __originDatas__ = WLDataManager.passwordList;
            __detailType__ = WLVcType_Detail_Password;
            __addType__ = WLVcType_Form_PasswordName;
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
    [_listView mg_registerCellNibs:@[ WLCommonTbCell.dy_name ]];
    self.tableView = _listView;
    

    WeakSelf(weakSelf)
    _btn.btnTitle = @"添加";
    _btn.block_click = ^(id sender) {
        [weakSelf action_new:nil];
    };
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify_didAddObj:) name:WLNotification_DidAddFinger object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify_didAddObj:) name:WLNotification_DidAddPassword object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify_didDelObj:) name:WLNotification_DidDelPassword object:nil];
    
    [WLAlertView showLoading:-1];
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




#pragma mark - Notification

- (void)notify_didAddObj:(NSNotification *)notify {
    if (self.sec.count == 0) {
        [self.sec wl_addObj:notify.object];
    } else {
        [self.sec insertObject:notify.object atIndex:0];
    }
    [_listView reloadData];
}
- (void)notify_didDelObj:(NSNotification *)notify {
    if ([self.sec containsObject:notify.object]) {
        [self.sec wl_removeObj:notify.object];
        [_listView reloadData];
    }
}




#pragma mark - Datas

- (void)loadDatas {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *datas = self->__originDatas__;
        [self.sec wl_addObjs:datas];
        [self.listView reloadData];
        
        [WLAlertView dismiss];
    });
    
}




#pragma mark - Actions

- (void)action_new:(id)sender {
    WLIndexFormVC *vc = [[WLIndexFormVC alloc] init];
    vc.vcType = __addType__;
    vc.isEdit = NO;
    [self.navigationController pushViewController:vc animated:YES];
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
    
    WLIndexDetailVC *vc = [[WLIndexDetailVC alloc] init];
    vc.vcType = __detailType__;
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
