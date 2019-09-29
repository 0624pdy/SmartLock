//
//  WLIndexFormVC.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBaseVC.h"

@interface WLIndexFormVC : WLBaseVC

@property (nonatomic,strong) id model;
@property (nonatomic,assign) BOOL isEdit;

@end




@interface WLTextFieldObj : NSObject

@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) BOOL hide;

@end
