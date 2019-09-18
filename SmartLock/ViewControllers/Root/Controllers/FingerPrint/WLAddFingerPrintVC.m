//
//  WLAddFingerPrintVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAddFingerPrintVC.h"

#import "WLAddFingerPrintVC_Step2.h"    //

@interface WLAddFingerPrintVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,assign) WLFingerPrintEditType type;
@property (nonatomic,assign) BOOL isEdit;

@end

@implementation WLAddFingerPrintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    WeakSelf(weakSelf)
    self.type = (_name ? WLFingerPrintEditType_Edit : WLFingerPrintEditType_Add);
    _isEdit = (_type == WLFingerPrintEditType_Edit);
    
    self.navigationItem.title = @{ @"0":@"添加指纹", @"1":@"修改指纹" }[@(self.type).stringValue];
    
    _listView.backgroundColor = RGB(245, 245, 245);
    _listView.separatorColor = WLColor_(225);
    _listView.block_tapTableView = ^(id obj) {
        [weakSelf.view endEditing:YES];
    };
    self.tableView = _listView;
    
    
    _btn.btnTitle = (_isEdit ? @"确认" : @"下一步");
    _btn.block_click = ^(id sender) {
        
        NSString *name = weakSelf.field.text;
        
        ///TODO: 下一步
        WLAddFingerPrintVC_Step2 *vc = [[WLAddFingerPrintVC_Step2 alloc] init];
        vc.printName = name;
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    
    if (_name) {
        _field.text = _name;
    }
    _btn.bgStyle = (_field.text.length > 0 ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_field becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

@end
