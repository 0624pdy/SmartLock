//
//  WLRootVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLRootVC.h"

#import "WLIndexItemView.h"

#import "WLIndexListVC.h"     //开门指纹、开门密码
#import "WLSettingsVC.h"            //设置
#import "WLVersionInfoVC.h"         //版本信息

@interface WLRootVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UIView *holder_on;
@property (weak, nonatomic) IBOutlet WLIndexItemView *item_fingerPrint;
@property (weak, nonatomic) IBOutlet WLIndexItemView *item_password;
@property (weak, nonatomic) IBOutlet WLIndexItemView *item_settings;

@property (weak, nonatomic) IBOutlet UIView *holder_off;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn_settings;

@end

@implementation WLRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    WeakSelf(weakSelf)
    
    self.navigationItem.title = @"菠萝智能锁";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_info"] style:UIBarButtonItemStylePlain target:self action:@selector(action_info:)];
    
    
    //蓝牙未开启视图
    _holder_off.alpha = 0;
    _btn_settings.btnTitle = @"前往设置";
    _btn_settings.block_click = ^(id sender) {
        ///TODO: 设置蓝牙
        NSString *path1 = @"App-Prefs:root=General&path=Bluetooth";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path1]];
    };
    
    
    //蓝牙已开启视图
    _holder_on.alpha = 0;
    [_item_fingerPrint setICON:@"index_fingerPrint" title:@"开门指纹" tag:0 action:^(NSInteger index) {
        WLIndexListVC *vc = [[WLIndexListVC alloc] init];
        vc.vcType = WLVcType_List_FingerPrint;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [_item_password setICON:@"index_password" title:@"开门密码" tag:1 action:^(NSInteger index) {
        WLIndexListVC *vc = [[WLIndexListVC alloc] init];
        vc.vcType = WLVcType_List_Password;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [_item_settings setICON:@"index_settings" title:@"设置" tag:2 action:^(NSInteger index) {
        WLSettingsVC *vc = [[WLSettingsVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    
    //监听蓝牙状态
    [[WLBluetoothManager sharedManager] currentState:^(WLBluetoothManager *theManager, BOOL enabled) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgView.image = [UIImage imageNamed:enabled ? @"index_bluetooth_on" : @"index_bluetooth_off"];
            [UIView animateWithDuration:0.5 animations:^{
                if (enabled) {
                    self.holder_on.alpha = 1;
                    self.holder_off.alpha = 0;
                } else {
                    self.holder_on.alpha = 0;
                    self.holder_off.alpha = 1;
                }
            }];
        });
    }];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}





#pragma mark -

- (void)action_info:(id)sender {
    WLVersionInfoVC *vc = [[WLVersionInfoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
