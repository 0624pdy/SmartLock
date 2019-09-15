//
//  WLRootVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLRootVC.h"

#import "WLIndexItemView.h"

#import "WLFingerPrintVC.h"     //开门指纹
#import "WLPasswordVC.h"        //开门密码
#import "WLSettingsVC.h"        //设置

@interface WLRootVC ()

@property (weak, nonatomic) IBOutlet WLIndexItemView *item_fingerPrint;
@property (weak, nonatomic) IBOutlet WLIndexItemView *item_password;
@property (weak, nonatomic) IBOutlet WLIndexItemView *item_settings;

@end

@implementation WLRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"菠萝智能锁";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_info"] style:UIBarButtonItemStylePlain target:self action:@selector(action_info:)];
    
    WeakSelf(weakSelf)
    [_item_fingerPrint setICON:@"index_fingerPrint" title:@"开门指纹" tag:0 action:^(NSInteger index) {
        WLFingerPrintVC *vc = [[WLFingerPrintVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [_item_password setICON:@"index_password" title:@"开门密码" tag:1 action:^(NSInteger index) {
        WLPasswordVC *vc = [[WLPasswordVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [_item_settings setICON:@"index_settings" title:@"设置" tag:2 action:^(NSInteger index) {
        WLSettingsVC *vc = [[WLSettingsVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}





#pragma mark -

- (void)action_info:(id)sender {
    NSLog(@"info");
}

@end
