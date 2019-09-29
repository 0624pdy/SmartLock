//
//  WLIndexFormVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLIndexFormVC.h"

#import "WLFingerPrintValidateVC.h"    //


WLTextFieldObj *textFieldObj(NSString *ph, NSString *text, BOOL hide) {
    WLTextFieldObj *obj = [WLTextFieldObj new];
    
    obj.placeholder = ph;
    obj.text        = text;
    obj.hide        = hide;
    
    return obj;
}


@interface WLIndexFormVC ()
{
    NSString *__navTitle__;
    NSString *__btnTitle__;
    WLTextFieldObj *__fieldObj__;
    WLTextFieldObj *__fieldObj_1__;
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
                _finger             = (WLFingerPrint *)_model;
                __navTitle__        = @"修改指纹";
                __fieldObj__        = textFieldObj(@"请输入指纹名称", _finger.name, NO);
                __fieldObj_1__      = textFieldObj(nil, nil, YES);
                __btnTitle__        = @"确认";
            } else {
                _finger             = [WLFingerPrint withName:nil];
                __navTitle__        = @"添加指纹";
                __fieldObj__        = textFieldObj(@"请输入指纹名称", nil, NO);
                __fieldObj_1__      = textFieldObj(nil, nil, YES);
                __btnTitle__        = @"下一步";
            }
        }
            break;
        case WLVcType_Form_PasswordName: {
            if (_isEdit) {
                _password           = (WLPassword *)_model;
                __navTitle__        = @"修改密码";
                __fieldObj__        = textFieldObj(@"请输入密码名称", _password.name, NO);
                __fieldObj_1__      = textFieldObj(nil, nil, YES);
                __btnTitle__        = @"确认";
            } else {
                _password           = [WLPassword withName:nil password:nil];
                __navTitle__        = @"添加密码";
                __fieldObj__        = textFieldObj(@"请输入密码名称", nil, NO);
                __fieldObj_1__      = textFieldObj(nil, nil, YES);
                __btnTitle__        = @"下一步";
            }
        }
            break;
        case WLVcType_Form_Password: {
            if (_isEdit) {
                _password           = (WLPassword *)_model;
                __navTitle__        = @"修改密码";
                __fieldObj__        = textFieldObj(@"输入密码", nil, NO);
                __fieldObj_1__      = textFieldObj(@"确认密码", nil, NO);
                __btnTitle__        = @"确认";
                
            } else {
                _password           = (WLPassword *)_model;
                __navTitle__        = @"设置密码";
                __fieldObj__        = textFieldObj(@"输入密码", nil, NO);
                __fieldObj_1__      = textFieldObj(@"确认密码", nil, NO);
                __btnTitle__        = @"下一步";
            }
        }
            break;
        default:
            break;
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
    
    //输入框 0
    _holder.hidden          = __fieldObj__.hide;
    _field.placeholder      = __fieldObj__.placeholder;
    _field.text             = __fieldObj__.text;
    _field.block_didChangeText = ^(UITextField *theField, NSString *text) {
        NSLog(@"field_0: %@", text);
        [weakSelf didInputText:text text1:nil];
    };
    
    //输入框 1
    _holder_1.hidden        = __fieldObj_1__.hide;
    _field_1.placeholder    = __fieldObj_1__.placeholder;;
    _field_1.text           = __fieldObj_1__.text;
    _field_1.block_didChangeText = ^(UITextField *theField, NSString *text) {
        NSLog(@"field_1: %@", text);
        [weakSelf didInputText:nil text1:text];
    };

    //底部按钮
    _btn.btnTitle = __btnTitle__;
    _btn.block_click = ^(id sender) {
        [weakSelf action_btn];
    };
    
    
    switch (self.vcType) {
        case WLVcType_Form_FingerName:
            _field.text = _finger.name;
            _btn.bgStyle = (_field.text.length > 0 ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
            break;
        case WLVcType_Form_PasswordName:
            _field.text = _password.name;
            _btn.bgStyle = (_field.text.length > 0 ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
            break;
        case WLVcType_Form_Password:
            _field.text = nil;
            _field_1.text = nil;
            break;
        default:
            break;
    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [_field becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}
- (void)dealloc {
    _field.block_didChangeText = nil;
    _field_1.block_didChangeText = nil;
}




#pragma mark -

- (void)didInputText:(NSString *)text text1:(NSString *)text1 {
    if (self.vcType == WLVcType_Form_FingerName) {
        _finger.name = text;
        
        _btn.bgStyle = (_finger.name.length > 0 ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
    }
    else if (self.vcType == WLVcType_Form_PasswordName) {
        _password.name = text;
        
        _btn.bgStyle = (_password.name.length > 0 ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
    }
    else if (self.vcType == WLVcType_Form_Password) {
        if (text) {
            _password.password = text;
        }
        if (text1) {
            _password.rePassword = text1;
        }
        
        _btn.bgStyle = ((_password.password.length > 0 && _password.rePassword.length > 0) ? DYBgStyle_EnabledGradient : DYBgStyle_DisabledNormal);
    }
}
- (void)action_btn {
    //指纹名称
    if (self.vcType == WLVcType_Form_FingerName) {
        if (_isEdit) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            WLFingerPrintValidateVC *vc = [[WLFingerPrintValidateVC alloc] init];
            vc.optType = WLFingerPrintOptType_Add;
            vc.model = _finger;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    //密码名称
    else if (self.vcType == WLVcType_Form_PasswordName) {
        //编辑
        if (_isEdit) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        //添加密码 step 1
        else {
            WLIndexFormVC *vc = [[WLIndexFormVC alloc] init];
            vc.vcType = WLVcType_Form_Password;
            vc.isEdit = NO;
            vc.model  = _password;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    //密码
    else if (self.vcType == WLVcType_Form_Password) {
        //修改
        if (_isEdit) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        //添加密码 step 2
        else {
            [[NSNotificationCenter defaultCenter] postNotificationName:WLNotification_DidAddFinger object:_password];
            
            NSArray *vcs = self.navigationController.viewControllers.mutableCopy;
            NSMutableArray *tmpVCs = vcs.mutableCopy;
            for (UIViewController *vc in vcs) {
                if ([vc isKindOfClass:[WLIndexFormVC class]]) {
                    [tmpVCs removeObject:vc];
                }
            }
            [self.navigationController setViewControllers:tmpVCs animated:YES];
        }
    }
}



#pragma mark -

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

@end






@implementation WLTextFieldObj

@end
