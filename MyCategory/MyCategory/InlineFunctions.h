//
//  InlineFunctions.h
//  MyCategory
//
//  Created by pdy's iMac on 2019/3/13.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#ifndef InlineFunctions_h
#define InlineFunctions_h

#import <UIKit/UIKit.h>

static inline UIColor * RGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a];
}
static inline UIColor * RGBColor(CGFloat r, CGFloat g, CGFloat b) {
    return RGBAColor(r, g, b, 1);
}
static inline UIColor *HexAColor(long hex, CGFloat a) {
    return [UIColor colorWithRed:((float)(((hex) & 0xFF0000) >> 16))/255.0
                           green:((float)(((hex) & 0xFF00) >> 8))/255.0
                            blue:((float)(((hex) & 0xFF)))/255.0
                           alpha:(a)];
}
static inline UIColor *HexColor(long hex) {
    return HexAColor(hex, 1);
}

static inline UIColor * RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return RGBAColor(r, g, b, a);
}
static inline UIColor *RGB(CGFloat r, CGFloat g, CGFloat b) {
    return RGBColor(r, g, b);
}
static inline UIColor *HexA(long hex, CGFloat a) {
    return HexAColor(hex, a);
}
static inline UIColor *Hex(long hex) {
    return HexColor(hex);
}

static inline BOOL is_iPhoneX_Series() {
    // iPhone X 以上设备iOS版本一定是11.0以上。
    if (@available(iOS 11.0, *)) {
        // 利用safeAreaInsets.bottom > 0.0来判断是否是iPhone X以上设备。
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        if (window.safeAreaInsets.bottom > 0.0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

#endif /* InlineFunctions_h */
