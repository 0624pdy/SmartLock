//
//  WLAddFingerPrintVC_Step2.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAddFingerPrintVC_Step2.h"

@interface WLAddFingerPrintVC_Step2 ()

@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;

@end

@implementation WLAddFingerPrintVC_Step2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"添加指纹";
    
    _btn.btnTitle = @"确认添加指纹";
    _btn.block_click = ^(id sender) {
        ///TODO: 添加指纹
        
    };
}

@end
