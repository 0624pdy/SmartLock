//
//  WLBaseVC.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBaseVC.h"

@interface WLBaseVC ()

@end

@implementation WLBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self wl_genDefaultValues];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_mg_hideNav) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    } else {
        if (_wl_hideNavLine) {
            [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        } else {
            [self.navigationController.navigationBar setShadowImage:nil];
        }
    }
}
- (void)dealloc {
    NSLog(@"dealloc %@", self);
}




#pragma mark -

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    
    [_tableView mg_registerDefaultViews];
    _tableView.mg_estimatedHeight = 0;
    _tableView.dataSource = self;
    _tableView.delegate = self;
}
- (void)setCollectionView:(UICollectionView *)collectionView {
    _collectionView = collectionView;
    
    [_collectionView mg_registerCellClasses:@[ UICollectionViewCell.dy_name ]];
    [_collectionView mg_registerHeaderClasses:@[ UICollectionReusableView.dy_name ]];
    [_collectionView mg_registerFooterClasses:@[ UICollectionReusableView.dy_name ]];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
}
- (NSMutableArray *)rootDatas {
    if (_rootDatas == nil) {
        _rootDatas = [@[] mutableCopy];
    }
    return _rootDatas;
}





- (void)wl_genDefaultValues {
    
}




#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark - UITableViewDataSource, UITableViewDelegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.rootDatas mg_numOfSection];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rootDatas mg_numOfRowsInSection:section];
}

#pragma mark - Section Header

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.headerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    if (sec.headerView) {
        return sec.headerView;
    } else if (sec.headerIden) {
        UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sec.headerIden];
        [self mg_tableView:tableView configHeader:header inSection:section];
        return header;
    } else {
        return nil;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.headerTitle;
}
- (void)mg_tableView:(UITableView *)tableView configHeader:(UIView *)header inSection:(NSInteger)section {
    
}

#pragma mark - Section Footer

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.footerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    if (sec.footerView) {
        return sec.footerView;
    } else if (sec.footerIden) {
        UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sec.footerIden];
        [self mg_tableView:tableView configFooter:footer inSection:section];
        return footer;
    } else {
        return nil;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.footerTitle;
}
- (void)mg_tableView:(UITableView *)tableView configFooter:(UIView *)footer inSection:(NSInteger)section {
    
}


#pragma mark - Row

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat rowHeight = [self.rootDatas mg_heightForRowAtIndexPath:indexPath];
    return rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIden = [self.rootDatas mg_cellIdenForRowAtIndexPath:indexPath];
    NSArray *sec  = [self.rootDatas mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden forIndexPath:indexPath];
    cell.dy_obj = row;
    [self mg_tableView:tableView configCell:cell model:row inSec:sec atIndexPath:indexPath];
    
    return cell;
}
- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec  = [self.rootDatas mg_secInSection:indexPath.section];
    NSObject *row = [sec mg_rowWithIndex:indexPath.row];
    
    [self mg_tableView:tableView didSelectRow:row inSec:sec atIndexPath:indexPath];
}
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec  atIndexPath:(NSIndexPath *)indexPath {
    
}





#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
#pragma mark -

//#pragma mark 打开点击事件
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.rootDatas mg_numOfSection];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.rootDatas mg_numOfRowsInSection:section];
}

#pragma mark - Item

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = [self.rootDatas mg_sizeForItemAtIndexPath:indexPath];
    return itemSize;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIden = [self.rootDatas mg_cellIdenForItemAtIndexPath:indexPath];
    NSArray *sec   = [self.rootDatas mg_secInSection:indexPath.section];
    NSObject *item = [sec mg_itemWithIndex:indexPath.item];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIden forIndexPath:indexPath];
    cell.dy_obj = item;
    [self mg_collectionView:collectionView configCell:cell model:item inSec:sec atIndexPath:indexPath];
    
    return cell;
}
- (void)mg_collectionView:(UICollectionView *)collectionView configCell:(UICollectionViewCell *)cell model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec   = [self.rootDatas mg_secInSection:indexPath.section];
    NSObject *item = [sec mg_itemWithIndex:indexPath.item];
    
    [self mg_collectionView:collectionView didSelectItem:item inSec:sec atIndexPath:indexPath];
}
- (void)mg_collectionView:(UICollectionView *)collectionView didSelectItem:(NSObject *)item inSec:(NSArray *)sec  atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Section Header & Section Footer

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.headerSize;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.footerSize;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSArray *sec = [self.rootDatas mg_secInSection:indexPath.section];
    NSString *iden = nil;
    
    // header
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (sec.headerIden) {
            iden = sec.headerIden;
        } else {
            iden = UICollectionReusableView.dy_name;
        }
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:iden forIndexPath:indexPath];
        
        [self mg_collectionView:collectionView configHeader:header atIndexPath:indexPath];
        
        return header;
    }
    // footer
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        if (sec.footerIden) {
            iden = sec.footerIden;
        } else {
            iden = UICollectionReusableView.dy_name;
        }
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:iden forIndexPath:indexPath];
        
        [self mg_collectionView:collectionView configFooter:footer atIndexPath:indexPath];
        
        return footer;
    }
    else {
        return [UICollectionReusableView new];
    }
}
- (void)mg_collectionView:(UICollectionView *)collectionView configHeader:(UICollectionReusableView *)header atIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)mg_collectionView:(UICollectionView *)collectionView configFooter:(UICollectionReusableView *)footer atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Others

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.sectionInsets;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.lineSpace;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    NSArray *sec = [self.rootDatas mg_secInSection:section];
    return sec.itemSpace;
}

@end
