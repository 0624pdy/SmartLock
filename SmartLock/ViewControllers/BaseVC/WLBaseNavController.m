//
//  WLBaseNavController.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBaseNavController.h"

@interface WLBaseNavController ()

@end

@implementation WLBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(action_back:)];
        viewController.navigationItem.leftBarButtonItem = back;
        
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)action_back:(id)sender {
    [self popViewControllerAnimated:YES];
}

@end
