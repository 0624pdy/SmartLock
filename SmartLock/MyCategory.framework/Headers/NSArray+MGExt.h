//
//  NSArray+MGExt.h
//  CashLoan
//
//  Created by Tim'MacPro on 2019/2/26.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#import "NSArray+WLSafe.h"      //安全
#import "NSArray+WLRandom.h"    //随机


@interface NSArray (MGExt)

@property (nonatomic,assign,readonly) NSInteger dy_numOfSection;
- (NSInteger)dy_numOfRowsInSection:(NSInteger )section;

- (NSArray *)dy_secInSection:(NSInteger)section;
- (NSArray *)dy_secAtIndexPath:(NSIndexPath *)indexPath;

- (id)dy_modelForRowAtIndexPath:(NSIndexPath *)indexPath;
- (id)dy_modelForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
