//
//  WLCommonTbCell.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLCommonTbCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_left;
@property (weak, nonatomic) IBOutlet UILabel *lbl_right;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;
@property (weak, nonatomic) IBOutlet UIView *cusView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cons_lblR_R;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cons_cusView_W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cons_cusView_H;


@property (nonatomic,assign) WLCellAccessoryType wl_accessoryType;
- (WLCellAccessoryType)wl_accessoryType UNAVAILABLE_ATTRIBUTE;

@end
