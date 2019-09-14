//
//  WLRootVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLRootVC.h"

@interface WLRootVC ()

@end

@implementation WLRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"菠萝智能锁";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_info"] style:UIBarButtonItemStylePlain target:self action:@selector(action_info:)];
}





#pragma mark -

- (void)action_info:(id)sender {
    NSLog(@"info");
}

@end
