//
//  WLVersionInfoVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLVersionInfoVC.h"

@interface WLVersionInfoVC ()

@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;

@end

@implementation WLVersionInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"版本信息";
    
    _btn.btnTitle = @"立即升级";
    _btn.block_click = ^(id sender) {
        NSLog(@"立即升级");
    };
}

@end
