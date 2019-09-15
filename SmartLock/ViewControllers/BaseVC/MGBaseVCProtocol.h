//
//  MGBaseVCProtocol.h
//  MGWeather
//
//  Created by MG_PDY on 2019/7/8.
//  Copyright © 2019 严楠楠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MGBaseVCProtocol <NSObject>

@optional

#pragma mark - Methods for UITableView
- (void)mg_tableView:(UITableView *)tableView configHeader:(UIView *)header inSection:(NSInteger)section;
- (void)mg_tableView:(UITableView *)tableView configFooter:(UIView *)footer inSection:(NSInteger)section;
- (void)mg_tableView:(UITableView *)tableView configCell:(UITableViewCell *)cell model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath;
- (void)mg_tableView:(UITableView *)tableView didSelectRow:(NSObject *)row inSec:(NSArray *)sec  atIndexPath:(NSIndexPath *)indexPath;

#pragma mark - Methods for UICollectionView

- (void)mg_collectionView:(UICollectionView *)collectionView configCell:(UICollectionViewCell *)cell model:(NSObject *)model inSec:(NSArray *)sec atIndexPath:(NSIndexPath *)indexPath;
- (void)mg_collectionView:(UICollectionView *)collectionView configHeader:(UICollectionReusableView *)header atIndexPath:(NSIndexPath *)indexPath;
- (void)mg_collectionView:(UICollectionView *)collectionView configFooter:(UICollectionReusableView *)footer atIndexPath:(NSIndexPath *)indexPath;
- (void)mg_collectionView:(UICollectionView *)collectionView didSelectItem:(NSObject *)item inSec:(NSArray *)sec  atIndexPath:(NSIndexPath *)indexPath;

@end

