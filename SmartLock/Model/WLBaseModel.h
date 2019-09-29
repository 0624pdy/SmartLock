//
//  WLBaseModel.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WLBaseModelProtocol <NSObject>

@required
@property (nonatomic,copy) NSString *name;

@end

@interface WLBaseModel : NSObject 

@property (nonatomic,copy) NSString *theName;
@property (nonatomic,copy) NSString *tag;

@end
