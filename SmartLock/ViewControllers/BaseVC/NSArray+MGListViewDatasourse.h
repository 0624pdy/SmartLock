//
//  NSArray+MGListViewDatasourse.h
//  MGWeather
//
//  Created by MG_PDY on 2019/7/8.
//  Copyright © 2019 严楠楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MGListViewDatasourse)



#pragma mark - Common

- (NSInteger)mg_numOfSection;

- (NSInteger)mg_numOfRowsInSection:(NSInteger)section;
- (NSInteger)mg_numOfItemsInSection:(NSInteger)section;

- (NSArray *)mg_secInSection:(NSInteger)section;

- (NSObject *)mg_rowWithIndex:(NSInteger)index;
- (NSObject *)mg_rowAtIndexPath:(NSIndexPath *)indexPath;

- (NSObject *)mg_itemWithIndex:(NSInteger)index;
- (NSObject *)mg_itemAtIndexPath:(NSIndexPath *)indexPath;



#pragma mark - UITableView

- (CGFloat)mg_heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)mg_cellIdenForRowAtIndexPath:(NSIndexPath *)indexPath;



#pragma mark - UICollectionView

- (CGSize)mg_sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)mg_cellIdenForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
