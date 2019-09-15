//
//  WLIndexItemView.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/15.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLIndexItemView : UIView < LoadXibInXibProtocol >

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;


@property (nonatomic,copy) void(^block_click)(NSInteger index);


- (void)setICON:(NSString *)icon title:(NSString *)title tag:(NSInteger)tag action:(void(^)(NSInteger index))action;

@end
