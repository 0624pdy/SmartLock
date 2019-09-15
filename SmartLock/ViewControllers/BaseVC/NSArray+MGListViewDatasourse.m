//
//  NSArray+MGListViewDatasourse.m
//  MGWeather
//
//  Created by MG_PDY on 2019/7/8.
//  Copyright © 2019 严楠楠. All rights reserved.
//

#import "NSArray+MGListViewDatasourse.h"

@implementation NSArray (MGListViewDatasourse)



#pragma mark - Coomon

- (NSInteger)mg_numOfSection {
    return self.count;
}
- (NSInteger)mg_numOfRowsInSection:(NSInteger)section {
    NSArray *sec = [self mg_secInSection:section];
    return sec.count;
}
- (NSInteger)mg_numOfItemsInSection:(NSInteger)section {
    NSArray *sec = [self mg_secInSection:section];
    return sec.count;
}

- (NSArray *)mg_secInSection:(NSInteger)section {
    if (section < self.count) {
        return self[section];
    }
    return nil;
}

- (NSObject *)mg_rowWithIndex:(NSInteger)index {
    if (index < self.count) {
        return self[index];
    }
    return nil;
}
- (NSObject *)mg_rowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self mg_secInSection:indexPath.section];
    if (sec && indexPath.row < sec.count) {
        return sec[indexPath.row];
    }
    return nil;
}

- (NSObject *)mg_itemWithIndex:(NSInteger)index {
    if (index < self.count) {
        return self[index];
    }
    return nil;
}
- (NSObject *)mg_itemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self mg_secInSection:indexPath.section];
    if (sec && indexPath.item < sec.count) {
        return sec[indexPath.item];
    }
    return nil;
}



#pragma mark - UITableView

- (CGFloat)mg_heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *sec  = [self mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.row];
    
    if (self.dy_rowHeight > 0.1) {
        return self.dy_rowHeight;
    } else if (sec.dy_rowHeight > 0.1) {
        return sec.dy_rowHeight;
    } else if (row.dy_rowHeight > 0.1) {
        return row.dy_rowHeight;
    } else {
        return 44;
    }
}
- (NSString *)mg_cellIdenForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIden = nil;
    
    NSArray  *sec = [self mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.row];
    
    if (self.dy_cellIden) {
        cellIden = self.dy_cellIden;
    } else if (sec.dy_cellIden) {
        cellIden = sec.dy_cellIden;
    } else if (row.dy_cellIden) {
        cellIden = row.dy_cellIden;
    } else {
        cellIden = UITableViewCell.dy_name;
    }
    
    return cellIden;
}



#pragma mark - UICollectionView

- (CGSize)mg_sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *sec  = [self mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.item];
    
    if (self.dy_itemSize.width > 0.1 || self.dy_itemSize.height > 0.1) {
        return self.dy_itemSize;
    } else if (sec.dy_itemSize.width > 0.1 || sec.dy_itemSize.height > 0.1) {
        return sec.dy_itemSize;
    } else if (row.dy_itemSize.width > 0.1 || row.dy_itemSize.height > 0.1) {
        return row.dy_itemSize;
    } else {
        return CGSizeMake(10, 10);
    }
}
- (NSString *)mg_cellIdenForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIden = nil;
    
    NSArray  *sec = [self mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.item];
    
    if (self.dy_cellIden) {
        cellIden = self.dy_cellIden;
    } else if (sec.dy_cellIden) {
        cellIden = sec.dy_cellIden;
    } else if (row.dy_cellIden) {
        cellIden = row.dy_cellIden;
    } else {
        cellIden = UICollectionViewCell.dy_name;
    }
    
    return cellIden;
}

@end
