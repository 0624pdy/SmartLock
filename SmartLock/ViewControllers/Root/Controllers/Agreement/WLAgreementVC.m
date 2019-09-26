//
//  WLAgreementVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/27.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAgreementVC.h"

@interface WLAgreementVC ()

@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;

@end

@implementation WLAgreementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.theWebView addToView:[self.view viewWithTag:11]];
    
    UIView *btmView = [self.view viewWithTag:22];
    [self.view bringSubviewToFront:btmView];
    [btmView showShadowWithColor:RGBA(0, 0, 0, 0.15) offset:CGSizeMake(0, -1) radius:10 opacity:1];
    
    _btn.btnTitle = @"同意";
    _btn.block_click = ^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}

@end
