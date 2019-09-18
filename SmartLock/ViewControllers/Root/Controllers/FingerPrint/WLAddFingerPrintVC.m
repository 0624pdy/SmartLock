//
//  WLAddFingerPrintVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAddFingerPrintVC.h"

#import "WLFingerPrintValidateVC.h"    //

@interface WLAddFingerPrintVC ()

@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,assign) BOOL isEdit;

@end

@implementation WLAddFingerPrintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    WeakSelf(weakSelf)
    _isEdit = (_model != nil);
    
    self.navigationItem.title = @{ @"0":@"添加指纹", @"1":@"修改指纹" }[@(_isEdit).stringValue];
    
    _listView.backgroundColor = RGB(245, 245, 245);
    _listView.separatorColor = WLColor_(225);
    _listView.block_tapTableView = ^(id obj) {
        [weakSelf.view endEditing:YES];
    };
    self.tableView = _listView;
    
    
    _btn.btnTitle = (_isEdit ? @"确认" : @"下一步");
    _btn.block_click = ^(id sender) {
        
        weakSelf.model.name = weakSelf.field.text;
        
        if (weakSelf.isEdit) {
            ///TODO: 确认
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } else {
            ///TODO: 下一步
            WLFingerPrintValidateVC *vc = [[WLFingerPrintValidateVC alloc] init];
            vc.model = weakSelf.model;
            vc.optType = WLFingerPrintOptType_Add;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    };
    
    
    if (_model) {
        _field.text = _model.name;
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
