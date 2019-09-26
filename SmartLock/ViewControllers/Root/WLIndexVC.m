//
//  WLIndexVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexVC.h"

#import "WLBaseNavController.h"
#import "WLAgreementVC.h"

@interface WLIndexVC ()

@property (weak, nonatomic) IBOutlet UIImageView *img_icon;
@property (weak, nonatomic) IBOutlet UIButton *btn_agreement;
@property (weak, nonatomic) IBOutlet UIButton *btn_agreement_1;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn_agree;

@end

@implementation WLIndexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _btn_agree.btnTitle = @"开始使用";
    _btn_agree.block_click = ^(id sender) {
        ///TODO: 开始使用
        [[NSNotificationCenter defaultCenter] postNotificationName:WLNotification_StartUsingApp object:nil];
    };
}



- (IBAction)action_agreement:(id)sender {
    WLAgreementVC *vc = [[WLAgreementVC alloc] init];
    vc.urlString = @"https://www.baidu.com/";
    WLBaseNavController *nav = [[WLBaseNavController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
