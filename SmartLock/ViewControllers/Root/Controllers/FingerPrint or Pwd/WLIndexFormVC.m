//
//  WLIndexFormVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexFormVC.h"

#import "WLFingerPrintValidateVC.h"    //

@interface WLIndexFormVC ()
{
    NSString *__navTitle__;
    NSString *__btnTitle__;
    NSString *__placeholder__;
    NSString *__placeholder_1__;
    BOOL      __hide_field__;
    BOOL      __hide_field_1__;
    WLBaseModel *__modelParam__;
}
@property (weak, nonatomic) IBOutlet UITableView *listView;

@property (weak, nonatomic) IBOutlet UIView *holder;
@property (weak, nonatomic) IBOutlet UITextField *field;

@property (weak, nonatomic) IBOutlet UIView *holder_1;
@property (weak, nonatomic) IBOutlet UITextField *field_1;

@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,strong) WLFingerPrint *finger;
@property (nonatomic,strong) WLPassword *password;

@end

@implementation WLIndexFormVC

- (void)wl_genDefaultValues {
    switch (self.vcType) {
        case WLVcType_Form_FingerName: {
            if (_isEdit) {
                __navTitle__        = @"修改指纹";
                __placeholder__     = @"请输入指纹名称";
                __placeholder_1__   = @"";
                __hide_field__      = NO;
                __hide_field_1__    = YES;
                __btnTitle__        = @"确认";
                __modelParam__      = (_finger ? : _password);
            } else {
                __navTitle__        = @"添加指纹";
                __placeholder__     = @"请输入指纹名称";
                __placeholder_1__   = @"";
                __hide_field__      = NO;
                __hide_field_1__    = YES;
                __btnTitle__        = @"下一步";
            }
        }
            break;
        case WLVcType_Form_PasswordName: {
            if (_isEdit) {
                __navTitle__        = @"修改密码";
                __placeholder__     = @"请输入密码名称";
                __placeholder_1__   = @"";
                __hide_field__      = NO;
                __hide_field_1__    = YES;
                __btnTitle__        = @"确认";
                __modelParam__      = (_finger ? : _password);
            } else {
                __navTitle__        = @"添加密码";
                __placeholder__     = @"请输入密码名称";
                __placeholder_1__   = @"";
                __hide_field__      = NO;
                __hide_field_1__    = YES;
                __btnTitle__        = @"下一步";
            }
        }
            break;
        case WLVcType_Form_Password: {
            if (_isEdit) {
                __navTitle__        = @"修改密码";
                __placeholder__     = @"输入密码";
                __placeholder_1__   = @"确认密码";
                __hide_field__      = NO;
                __hide_field_1__    = NO;
                __btnTitle__        = @"确认";
                __modelParam__      = (_finger ? : _password);
            } else {
                __navTitle__        = @"设置密码";
                __placeholder__     = @"输入密码";
                __placeholder_1__   = @"确认密码";
                __hide_field__      = NO;
                __hide_field_1__    = NO;
                __btnTitle__        = @"下一步";
            }
        }
            break;
        default:
            break;
    }
    
    if ([_model isKindOfClass:[WLFingerPrint class]]) {
        _finger = (WLFingerPrint *)_model;
    } else if ([_model isKindOfClass:[WLPassword class]]) {
        _password = (WLPassword *)_model;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    WeakSelf(weakSelf)

    self.navigationItem.title = __navTitle__;
    
    _listView.backgroundColor = RGB(245, 245, 245);
    _listView.separatorColor = WLColor_(225);
    _listView.block_tapTableView = ^(id obj) {
        [weakSelf.view endEditing:YES];
    };
    self.tableView = _listView;
    
    //输入框
    _field.placeholder = __placeholder__;
    _field_1.placeholder = __placeholder_1__;
    _holder.hidden = __hide_field__;
    _holder_1.hidden = __hide_field_1__;
    
    //底部按钮
    _btn.btnTitle = __btnTitle__;
    _btn.block_click = ^(id sender) {
        
        if (weakSelf.finger) {
            weakSelf.finger.name = weakSelf.field.text;
        }
        if (weakSelf.password) {
            weakSelf.password.name = weakSelf.field.text;
        }
        
        if (weakSelf.isEdit) {
            ///TODO: 确认
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } else {
            ///TODO: 下一步
            WLFingerPrintValidateVC *vc = [[WLFingerPrintValidateVC alloc] init];
            vc.model = self->__modelParam__;
            vc.optType = WLFingerPrintOptType_Add;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    };
    
    
    if (_finger) {
        _field.text = _finger.name;
    }
    if (_password) {
        _field.text = _password.name;
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




#pragma mark -

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

@end
