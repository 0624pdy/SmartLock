//
//  WLPassword.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBaseModel.h"

@interface WLPassword : WLBaseModel < WLBaseModelProtocol >

@property (nonatomic,copy) NSString *name;          //名称
@property (nonatomic,copy) NSString *addTime;       //添加时间

@property (nonatomic,copy) NSString *password;      //密码
@property (nonatomic,copy) NSString *rePassword;    //确认密码


+ (instancetype)withName:(NSString *)name password:(NSString *)password;

@end
