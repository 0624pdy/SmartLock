//
//  WLSubmitButton.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLSubmitButton : UIButton

@property (nonatomic,copy) NSString *btnTitle;
@property (nonatomic,copy) void(^block_click)(id sender);

@end
