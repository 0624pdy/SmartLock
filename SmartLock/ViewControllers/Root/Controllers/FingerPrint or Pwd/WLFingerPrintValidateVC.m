//
//  WLFingerPrintValidateVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLFingerPrintValidateVC.h"

@interface WLFingerPrintValidateVC ()
{
    NSString *_navTitle;
    NSString *_btnTitle;
    NSString *_desc_0;
    NSString *_desc_1;
}
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet WLSubmitButton *btn;


@property (nonatomic,strong) WLFingerPrint *theModel;

@end

@implementation WLFingerPrintValidateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self handleValues];
    
    self.navigationItem.title = _navTitle;
    
    
//    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] initWithString:@""];
//
//    NSMutableParagraphStyle *style0 = [[NSMutableParagraphStyle alloc] init];
//    style0.lineSpacing = 5;
//    style0.paragraphSpacing = 10;
//
//    NSAttributedString *br = [[NSAttributedString alloc] initWithString:@"\n"];
//    NSAttributedString *attr0 = [[NSAttributedString alloc] initWithString:@"请在门锁上校验开门指纹或密码" attributes:@{ NSForegroundColorAttributeName : WLColor_51, NSFontAttributeName : WLFont_Regular(16) }];
//    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:@"如果指纹无法校验或忘记密码" attributes:@{ NSForegroundColorAttributeName : RGBA(92, 159, 254, 1), NSFontAttributeName : WLFont_Regular(12) }];
//    NSAttributedString *attr2 = [[NSAttributedString alloc] initWithString:@"可输入门锁安全码后，再插入钥匙拧至开门状态即可" attributes:@{ NSForegroundColorAttributeName : RGBA(92, 159, 254, 1), NSFontAttributeName : WLFont_Regular(12) }];
//
//    [mAttr appendAttributedString:attr0];
//    [mAttr appendAttributedString:br];
//    [mAttr appendAttributedString:attr1];
//    NSRange range0 = NSMakeRange(0, mAttr.length);
//    [mAttr appendAttributedString:br];
//    [mAttr addAttribute:NSParagraphStyleAttributeName value:style0 range:range0];
//
//    NSMutableParagraphStyle *style1 = [[NSMutableParagraphStyle alloc] init];
//    style1.lineSpacing = 4;
//    style1.paragraphSpacing = 0;
//
//    NSMutableAttributedString *mAttr2 = [attr2 mutableCopy];
//    NSRange range1 = NSMakeRange(0, mAttr2.length);
//    [mAttr2 addAttribute:NSParagraphStyleAttributeName value:style1 range:range1];
//
//    [mAttr appendAttributedString:mAttr2];
//    _lbl.attributedText = mAttr;
    
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@""];
    [attr appendAttributedString:[[NSAttributedString alloc] initWithString:_desc_0 attributes:@{ NSForegroundColorAttributeName : WLColor_51, NSFontAttributeName : WLFont_Regular(16) }]];
    if (_desc_1) {
        [attr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        [attr appendAttributedString:[[NSAttributedString alloc] initWithString:_desc_1 attributes:@{ NSForegroundColorAttributeName : RGBA(92, 159, 254, 1), NSFontAttributeName : WLFont_Regular(12) }]];
    }
    _lbl.text = nil;
    _lbl.attributedText = attr;
    [_lbl wl_setLineSpace:5 paragraphSpace:10];
    _lbl.textAlignment = NSTextAlignmentCenter;
    
    
    WeakSelf(weakSelf)
    _btn.btnTitle = _btnTitle;
    _btn.block_click = ^(id sender) {
        ///TODO: 添加指纹
        [weakSelf didAddFinger];
    };
}




#pragma mark -

- (void)didAddFinger {
    if (_optType == WLFingerPrintOptType_Add) {
        [[NSNotificationCenter defaultCenter] postNotificationName:WLNotification_DidAddFinger object:_model];
        
        NSArray *vcs = self.navigationController.viewControllers.mutableCopy;
        NSMutableArray *targetVCs = @[].mutableCopy;
        for (UIViewController *vc in vcs) {
            if ([vc isKindOfClass:NSClassFromString(@"WLIndexFormVC")]) {
                break;
            }
            [targetVCs addObject:vc];
        }
        [self.navigationController setViewControllers:targetVCs animated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}




#pragma mark -

- (void)handleValues {
    switch (_optType) {
        case WLFingerPrintOptType_Add: {
            _navTitle = @"添加指纹";
            _btnTitle = @"确认添加指纹";
            _desc_0 = @"请将手指放至在图示区域";
            _desc_1 = nil;
        }
            break;
        case WLFingerPrintOptType_Reset: {
            _navTitle = @"重录指纹";
            _btnTitle = @"录入成功";
            _desc_0 = @"重录成功后将覆盖原有数据 请将手指放至在图示区域";
            _desc_1 = nil;
        }
            break;
        case WLFingerPrintOptType_Verify: {
            _navTitle   = @"安全校验";
            _btnTitle   = @"手机校验开门密码";
            _desc_0     = @"请在门锁上校验开门指纹或密码";
            _desc_1     = @"如果指纹无法校验或忘记密码 可输入门锁安全码后，再插入钥匙拧至开门状态即可";
        }
            break;
        default: {
            
        }
            break;
    }
    
    _theModel = (WLFingerPrint *)_model;
}

@end
