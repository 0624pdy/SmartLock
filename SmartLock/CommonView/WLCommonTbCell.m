//
//  WLCommonTbCell.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/18.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLCommonTbCell.h"

@implementation WLCommonTbCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _lbl_left.text = nil;
    _lbl_right.text = nil;
    self.wl_accessoryType = WLCellAccessoryType_None;
}



- (void)setWl_accessoryType:(WLCellAccessoryType)wl_accessoryType {
    [self hideRightViews];
    self.accessoryType = (wl_accessoryType == WLCellAccessoryType_Arrow ?
                            UITableViewCellAccessoryDisclosureIndicator :
                            UITableViewCellAccessoryNone
                         );
    if (@available(iOS 13, *)) {
        _cons_lblR_R.constant = (wl_accessoryType == WLCellAccessoryType_Arrow ? 8 : 16);
    } else {
        _cons_lblR_R.constant = (wl_accessoryType == WLCellAccessoryType_Arrow ? 0 : 16);
    }
    
    switch (wl_accessoryType) {
        case WLCellAccessoryType_None: {
            _lbl_right.hidden = NO;
        }
            break;
        case WLCellAccessoryType_Arrow: {
            _lbl_right.hidden = NO;
        }
            break;
        case WLCellAccessoryType_Switch: {
            _theSwitch.hidden = NO;
        }
            break;
        case WLCellAccessoryType_Custom: {
            _cusView.hidden = NO;
        }
            break;
        default: {
            
        }
            break;
    }
}
- (void)hideRightViews {
    _lbl_right.hidden = NO;
    _theSwitch.hidden = YES;
    _cusView.hidden = YES;
}

@end
