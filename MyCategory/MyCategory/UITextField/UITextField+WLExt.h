//
//  UITextField+WLExt.h
//  MyCategory
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (WLExt)

@property (nonatomic,assign) BOOL isObserver;
@property (nonatomic,copy) void(^block_didChangeText) (UITextField *theField, NSString *text);

@end
