//
//  WLAlertView+PDYExt.h
//  PDYDemos
//
//  Created by MG_PDY on 2019/4/1.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAlertView.h"

@interface WLAlertView (PDYExt)


#pragma mark - 显示【文本】

/**
 *  显示提示【文本】
 *  @param text - 要显示的文本
 */
+ (void)showText:(NSString *)text;
/**
 *  显示提示【文本】，延迟delay秒关闭
 *  @param text     - 要显示的文本
 *  @param delay    - 延迟关闭的时间
 */
+ (void)showText:(NSString *)text dismissDelay:(NSTimeInterval)delay;


#pragma mark - 显示【富文本】

/**
 *  显示提示【富文本】
 *  @param attrText - 要显示的富文本
 */
+ (void)showAttributedText:(NSAttributedString *)attrText;
/**
 *  显示提示【富文本】，延迟delay秒关闭
 *  @param attrText - 要显示的富文本
 *  @param delay    - 延迟关闭的时间
 */
+ (void)showAttributedText:(NSAttributedString *)attrText dismissDelay:(NSTimeInterval)delay;


#pragma mark - 显示【活动指示器】

/**
 *  显示【活动指示器】
 */
+ (void)showLoading;
/**
 *  显示【活动指示器】
 *  @param delay - 延迟关闭的时间
 */
+ (void)showLoading:(NSTimeInterval)delay;
/**
 *  显示【活动指示器】，需手动关闭
 *  @note 关闭方法：[WLAlertView dismiss];
 */
+ (void)showLoadingAlways;


#pragma mark - 显示【活动指示器】+【文本】

/**
 *  显示【活动指示器】+【文本】
 *  @param text - 要显示的文本
 */
+ (void)showLoadingWithText:(NSString *)text;
/**
 *  显示【活动指示器】+【文本】，延迟delay秒关闭
 *  @param text     - 要显示的文本
 *  @param delay    - 延迟关闭的时间
 */
+ (void)showLoadingWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay;


#pragma mark - 显示【图片】

/**
 *  显示提示【图片】
 *  @param image - 要显示的图片
 */
+ (void)showImage:(id)image;
/**
 *  显示提示【图片】，延迟delay秒关闭
 *  @param image    - 要显示的图片
 *  @param delay    - 延迟关闭的时间
 */
+ (void)showImage:(id)image dismissDelay:(NSTimeInterval)delay;


#pragma mark - 显示【图片】+【文本】

/**
 *  显示提示【图片】+【文本】
 *  @param image    - 要显示的图片
 *  @param text     - 要显示的文本
 */
+ (void)showImage:(id)image text:(NSString *)text;
/**
 *  显示提示【图片】+【文本】
 *  @param image    - 要显示的图片
 *  @param text     - 要显示的文本
 *  @param delay    - 延迟关闭的时间
 */
+ (void)showImage:(id)image text:(NSString *)text dismissDelay:(NSTimeInterval)delay;


#pragma mark - 显示【自定义视图】

/**
 *  显示【自定义视图】
 *  @param customView   - 要显示的自定义视图
 *  @param size         - 自定义视图尺寸
 */
+ (void)showWithCustomView:(UIView *)customView size:(CGSize)size;
/**
 *  显示【自定义视图】
 *  @param customView   - 要显示的自定义视图
 *  @param size         - 自定义视图尺寸
 *  @param delay        - 延迟关闭的时间
 */
+ (void)showWithCustomView:(UIView *)customView size:(CGSize)size dismissDelay:(NSTimeInterval)delay;

@end
