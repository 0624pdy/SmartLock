//
//  UIAlertController+WLExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/3/27.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UIAlertController+WLExt.h"

#import "RuntimeProperty.h"
#import "UIViewController+MGExt.h"

@implementation UIAlertController (WLExt)

+ (UIAlertController *)alertWithTitle:(id)title message:(id)message cancel:(id)cancel others:(NSArray<id> *)others action:(WLAlertActionBlock)action {
    
    NSString *theTitle = title;
    NSString *theMsg   = message;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:theTitle message:theMsg preferredStyle:UIAlertControllerStyleAlert];
    
    NSInteger index = -1;
    UIAlertAction *theAction = nil;
    NSString *actTitle = nil;
    
    for (id obj in others) {
        
        index = [others indexOfObject:obj];
        
        actTitle = [NSString stringWithFormat:@"%@", obj];
        
        UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
        if ([obj isKindOfClass:[NSString class]]) {
            actionStyle = ((NSString *)obj).destructive ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault;
        }
        theAction = [UIAlertAction actionWithTitle:actTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action_) {
            if (action) {
                action(alert, index, action_.title);
            }
        }];
        
        [alert addAction:theAction];
    }
    
    if (cancel) {
        NSString *cancel_ = cancel;
        [alert addAction:[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action_) {
            if (action) {
                action(alert, -1, cancel_);
            }
        }]];
    }
    
    return alert;
}
+ (UIAlertController *)showAlertInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                            settings:(WLAlertSettingsBlock)settings
                              action:(WLAlertActionBlock)action
{
    UIAlertController *alert = [self alertWithTitle:title
                                            message:message
                                             cancel:cancel
                                             others:others
                                             action:action];
    
    if (settings) {
        settings(alert);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc = (aVC ? : [UIApplication sharedApplication].keyWindow.rootViewController);
        [vc presentViewController:alert animated:YES completion:nil];
    });
    
    return alert;
}
+ (UIAlertController *)showAlertInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                              action:(WLAlertActionBlock)action
{
    return [self showAlertInVC:aVC
                         title:title
                       message:message
                        cancel:cancel
                        others:others
                      settings:nil
                        action:action];
}

- (BOOL)wl_dismissWhenTapBg {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setWl_dismissWhenTapBg:(BOOL)wl_dismissWhenTapBg {
    objc_setAssociatedObject(self, @selector(wl_dismissWhenTapBg), @(wl_dismissWhenTapBg), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (wl_dismissWhenTapBg) {
        
        __weak __typeof__(self) weakSelf = self;
        __block UIView *superview = nil;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action_tapBg:)];
        
        self.block_viewWillAppear = ^(UIViewController *theVC, BOOL animated) {
            superview = weakSelf.view.superview;
            superview.userInteractionEnabled = YES;
            [superview addGestureRecognizer:tap];
        };
        self.block_viewWillDisappear = ^(UIViewController *theVC, BOOL animated) {
            superview = weakSelf.view.superview;
            [superview removeGestureRecognizer:tap];
        };
    }
}
- (void)action_tapBg:(UITapGestureRecognizer *)tap {
    //NSLog(@"%@", tap);
    [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark -

+ (UIAlertController *)sheetWithTitle:(id)title message:(id)message cancel:(id)cancel others:(NSArray<id> *)others action:(WLAlertActionBlock)action {
    
    NSString *theTitle = title;
    NSString *theMsg   = message;
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:theTitle message:theMsg preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSInteger index = -1;
    UIAlertAction *theAction = nil;
    NSString *actTitle = nil;
    
    for (id obj in others) {
        
        index = [others indexOfObject:obj];
        
        actTitle = [NSString stringWithFormat:@"%@", obj];
        
        UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
        if ([obj isKindOfClass:[NSString class]]) {
            actionStyle = ((NSString *)obj).destructive ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault;
        }
        theAction = [UIAlertAction actionWithTitle:actTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action_) {
            if (action) {
                action(sheet, index, action_.title);
            }
        }];
        
        [sheet addAction:theAction];
    }
    
    if (cancel) {
        NSString *cancel_ = cancel;
        [sheet addAction:[UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action_) {
            if (action) {
                action(sheet, -1, cancel_);
            }
        }]];
    }
    
    return sheet;
}

+ (UIAlertController *)showSheetInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                            settings:(WLAlertSettingsBlock)settings
                              action:(WLAlertActionBlock)action
{
    UIAlertController *sheet = [self sheetWithTitle:title
                                            message:message
                                             cancel:cancel
                                             others:others
                                             action:action];
    
    if (settings) {
        settings(sheet);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *vc = (aVC ? : [UIApplication sharedApplication].keyWindow.rootViewController);
        [vc presentViewController:sheet animated:YES completion:nil];
    });
    
    return sheet;
}

+ (UIAlertController *)showSheetInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                              action:(WLAlertActionBlock)action
{
    return [self showAlertInVC:aVC
                         title:title
                       message:message
                        cancel:cancel
                        others:others
                      settings:nil
                        action:action];
}

@end







@implementation NSObject (AlertControllerExt)

RuntimeProperty_imp_NonObj_(destructive, setDestructive, BOOL)

- (id)asDestructive {
    self.destructive = YES;
    return self;
}

@end






@implementation NSArray (AlertControllerExt)

- (void)setDestructiveIndex:(NSInteger)destructiveIndex {
    
    NSInteger i = -1;
    
    for (NSObject *obj in self) {
        
        i = [self indexOfObject:obj];
        
        if (i == destructiveIndex) {
            obj.destructive = YES;
        } else {
            obj.destructive = NO;
        }
    }
}

- (void)setDestructiveObj:(id)destructiveObj {
    for (NSObject *obj in self) {
        if (obj == destructiveObj) {
            obj.destructive = YES;
        } else {
            obj.destructive = NO;
        }
    }
}

@end
