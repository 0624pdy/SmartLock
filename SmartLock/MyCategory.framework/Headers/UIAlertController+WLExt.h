//
//  UIAlertController+WLExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/3/27.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WLAlertSettingsBlock)(UIAlertController *theVC);
typedef void(^WLAlertActionBlock)(UIAlertController *theVC, NSInteger actionIndex, NSString *actionTitle);

@interface UIAlertController (WLExt)




#pragma mark - Alert

/**
 *  点击弹窗背景是否关闭弹窗
 */
@property (nonatomic,assign) BOOL wl_dismissWhenTapBg;

/**
 *  系统弹窗
 *  @param title    - 标题
 *  @param message  - 副标题
 *  @param cancel   - 取消
 *  @param others   - 其他选项
 *  @param action   - 事件回调（ actionIndex: 事件索引，cancel(-1)，actionTitle: 事件名称 ）
 *  @return 弹窗实例
 */
+ (UIAlertController *)alertWithTitle:(id)title
                              message:(id)message
                               cancel:(id)cancel
                               others:(NSArray<id> *)others
                               action:(WLAlertActionBlock)action;

/**
 *  系统弹窗
 *  @param aVC      - 要显示该弹窗的视图控制器
 *  @param title    - 标题
 *  @param message  - 副标题
 *  @param cancel   - 取消
 *  @param others   - 其他选项
 *  @param settings - 配置相关
 *  @param action   - 事件回调（ actionIndex: 事件索引，cancel(-1)，actionTitle: 事件名称 ）
 *  @return 弹窗实例
 */
+ (UIAlertController *)showAlertInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                            settings:(WLAlertSettingsBlock)settings
                              action:(WLAlertActionBlock)action;

/**
 *  系统弹窗
 *  @param aVC      - 要显示该弹窗的视图控制器
 *  @param title    - 标题
 *  @param message  - 副标题
 *  @param cancel   - 取消
 *  @param others   - 其他选项
 *  @param action   - 事件回调（ actionIndex: 事件索引，cancel(-1)，actionTitle: 事件名称 ）
 *  @return 弹窗实例
 */
+ (UIAlertController *)showAlertInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                              action:(WLAlertActionBlock)action;







#pragma mark - ActionSheet

/**
 *  系统actionSheet
 *  @param title    - 标题
 *  @param message  - 副标题
 *  @param cancel   - 取消
 *  @param others   - 其他选项
 *  @param action   - 事件回调（ actionIndex: 事件索引，cancel(-1)，actionTitle: 事件名称 ）
 *  @return 弹窗实例
 */
+ (UIAlertController *)sheetWithTitle:(id)title
                              message:(id)message
                               cancel:(id)cancel
                               others:(NSArray<id> *)others
                               action:(WLAlertActionBlock)action;

+ (UIAlertController *)showSheetInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                            settings:(WLAlertSettingsBlock)settings
                              action:(WLAlertActionBlock)action;

+ (UIAlertController *)showSheetInVC:(UIViewController *)aVC
                               title:(id)title
                             message:(id)message
                              cancel:(id)cancel
                              others:(NSArray<id> *)others
                              action:(WLAlertActionBlock)action;


@end







@interface NSObject (AlertControllerExt)

@property (nonatomic,assign) BOOL destructive;
- (id)asDestructive;

@end





@interface NSArray (AlertControllerExt)

@property (nonatomic,assign) NSInteger destructiveIndex;
- (NSInteger)destructiveIndex UNAVAILABLE_ATTRIBUTE;

@property (nonatomic,strong) id destructiveObj;
- (id)destructiveObj UNAVAILABLE_ATTRIBUTE;

@end





/*

[UIAlertController showAlertInVC:self
                           title:@"title"
                         message:@"message"
                          cancel:@"cancel"
                          others:@[ @"item 0", @"item 1", @"item 2" ]
                        settings:^(UIAlertController *theVC)
 {
     theVC.wl_dismissWhenTapBg = YES;
 }
                          action:^(NSInteger actionIndex, NSString *actionTitle)
 {
     
 }];



UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
[alert addAction:[UIAlertAction actionWithTitle:@"item 0" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
}]];
[alert addAction:[UIAlertAction actionWithTitle:@"item 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
}]];
[alert addAction:[UIAlertAction actionWithTitle:@"item 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
}]];
[alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
}]];
[self presentViewController:alert animated:YES completion:nil];

*/
