//
//  UITableView+Tap.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Tap)

@property (nonatomic,copy) void(^block_tapTableView) (id obj);

@end
