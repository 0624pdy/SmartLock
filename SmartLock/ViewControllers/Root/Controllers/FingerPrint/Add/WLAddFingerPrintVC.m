//
//  WLAddFingerPrintVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAddFingerPrintVC.h"

#import "WLSubmitButton.h"

#import "WLAddFingerPrintVC_Step2.h"    //

@interface WLAddFingerPrintVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;

@end

@implementation WLAddFingerPrintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"添加指纹";
    
    _listView.backgroundColor = RGB(245, 245, 245);
    _listView.separatorColor = WLColor_(225);
    self.tableView = _listView;
    
    WeakSelf(weakSelf)
    
    _btn.btnTitle = @"下一步";
    _btn.block_click = ^(id sender) {
        
        NSString *name = weakSelf.field.text;
        
        ///TODO: 下一步
        WLAddFingerPrintVC_Step2 *vc = [[WLAddFingerPrintVC_Step2 alloc] init];
        vc.printName = name;
        [self.navigationController pushViewController:vc animated:YES];
    };
}

@end
