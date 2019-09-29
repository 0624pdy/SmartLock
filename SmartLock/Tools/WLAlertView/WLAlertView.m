//
//  WLAlertView.m
//  PDYDemos
//
//  Created by MG_PDY on 2019/3/25.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLAlertView.h"

#ifndef ScreenWidth
#define ScreenWidth     UIScreen.mainScreen.bounds.size.width
#endif
#ifndef ScreenHeight
#define ScreenHeight    UIScreen.mainScreen.bounds.size.height
#endif

@interface WLAlertView ()
{
    NSTimer *_timer;
    NSTimeInterval _seconds;
}
@property (weak, nonatomic) IBOutlet UIToolbar *bg_blur;
@property (weak, nonatomic) IBOutlet UIView *holder;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_desc;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actView;
@property (weak, nonatomic) IBOutlet UIImageView *img_icon;

@end

@implementation WLAlertView

static WLAlertView *alertView = nil;

+ (instancetype)sharedView {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
        [alertView defaultSetup];
    });
    return alertView;
}
- (void)defaultSetup {
    
    UIColor *txtColor = RGBA(51, 51, 51, 1);
    
    _lbl_title.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    _lbl_title.numberOfLines = 0;
    _lbl_title.textColor = txtColor;
    _lbl_title.hidden = NO;
    _lbl_title.alpha = 1;
    _lbl_title.textAlignment = NSTextAlignmentCenter;
    
    _lbl_desc.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    _lbl_desc.numberOfLines = 0;
    _lbl_desc.textColor = txtColor;
    _lbl_desc.hidden = NO;
    _lbl_desc.alpha = 1;
    _lbl_desc.textAlignment = NSTextAlignmentCenter;
    
    //_actView.wl_borderWidth_black = 1;
    //_lbl_title.wl_borderWidth_black = 1;
    //_lbl_desc.wl_borderWidth_black = 1;
    
    _contentEdgeInsets  = UIEdgeInsetsMake(20, 20, 20, 20);
    _bgStyle            = WLAlertBgStyle_None;
    
    self.cornerRadius   = 12;
    self.bgStyle        = WLAlertBgStyle_Black;
    self.style          = WLAlertStyle_ActOnly;
}




#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateFrame];
}
- (void)updateFrame {
    
    CGFloat W = 0;
    CGFloat H = 0;
    
    switch (_style) {
            
        case WLAlertStyle_TxtOnly: {
            
            CGFloat maxW = (ScreenWidth -32 -_contentEdgeInsets.left -_contentEdgeInsets.right);
            CGSize textSize = [_lbl_title sizeThatFits:CGSizeMake(maxW, CGFLOAT_MAX)];
            
            CGFloat txtW = textSize.width;
            if (txtW > maxW) {
                txtW = maxW;
            }
            
            W = (_contentEdgeInsets.left + txtW +_contentEdgeInsets.right);
            H = (_contentEdgeInsets.top + textSize.height + _contentEdgeInsets.bottom);
            
            _lbl_title.frame = CGRectMake(_contentEdgeInsets.left, _contentEdgeInsets.top, txtW, textSize.height);
            
        }
            break;
            
        case WLAlertStyle_AttrTxt: {
            
            CGFloat maxW = (ScreenWidth -32 -_contentEdgeInsets.left -_contentEdgeInsets.right);
            CGSize textSize = [_lbl_title sizeThatFits:CGSizeMake(maxW, CGFLOAT_MAX)];
            
            CGFloat txtW = textSize.width;
            if (txtW > maxW) {
                txtW = maxW;
            }
            
            W = (_contentEdgeInsets.left + txtW +_contentEdgeInsets.right);
            H = (_contentEdgeInsets.top + textSize.height + _contentEdgeInsets.bottom);
            
            _lbl_title.frame = CGRectMake(_contentEdgeInsets.left, _contentEdgeInsets.top, txtW, textSize.height);
            
        }
            break;
            
        case WLAlertStyle_ActOnly: {
            
            W = (_contentEdgeInsets.left + _actView.dy_W + _contentEdgeInsets.right);
            H = (_contentEdgeInsets.top + _actView.dy_H + _contentEdgeInsets.bottom);
            
            _actView.frame = CGRectMake(W/2 -_actView.dy_W/2, H/2 -_actView.dy_H/2, _actView.dy_W, _actView.dy_H);
            
        }
            break;
            
        case WLAlertStyle_ImgOnly: {
            
            W = 80;
            H = W;
            CGFloat padding = 16;

            _img_icon.frame = CGRectMake(padding, padding, W -padding*2, H- padding*2);
            
        }
            break;
            
        case WLAlertStyle_ActTxt: {
            
            CGFloat minW = (_contentEdgeInsets.left +_actView.dy_W +_contentEdgeInsets.right);
            CGFloat maxW = (ScreenWidth -32 -_contentEdgeInsets.left -_contentEdgeInsets.right);
            CGSize textSize = [_lbl_title sizeThatFits:CGSizeMake(maxW, CGFLOAT_MAX)];
            
            CGFloat txtW = textSize.width;
            
            if (txtW < minW) {
                txtW = minW;
            } else if (txtW > maxW) {
                txtW = maxW;
            }
            
            W = (_contentEdgeInsets.left + txtW +_contentEdgeInsets.right);
            H = (_contentEdgeInsets.top + _actView.dy_H + 15 + textSize.height + _contentEdgeInsets.bottom);
            
            _actView.frame = CGRectMake(W/2 -_actView.dy_W/2, _contentEdgeInsets.top, _actView.dy_W, _actView.dy_H);
            _lbl_title.frame = CGRectMake(_contentEdgeInsets.left, _actView.dy_B +15, txtW, textSize.height);
        }
            break;
            
        case WLAlertStyle_ImgTxt: {
            
            _img_icon.frame = CGRectMake(0, 0, 44, 44);
            
            CGFloat minW = (_contentEdgeInsets.left +_img_icon.dy_W +_contentEdgeInsets.right);
            CGFloat maxW = (ScreenWidth -32 -_contentEdgeInsets.left -_contentEdgeInsets.right);
            CGSize textSize = [_lbl_title sizeThatFits:CGSizeMake(maxW, CGFLOAT_MAX)];
            
            CGFloat txtW = textSize.width;
            
            if (txtW < minW) {
                txtW = minW;
            } else if (txtW > maxW) {
                txtW = maxW;
            }
            
            W = (_contentEdgeInsets.left + txtW +_contentEdgeInsets.right);
            H = (_contentEdgeInsets.top + _img_icon.dy_H + 15 + textSize.height + _contentEdgeInsets.bottom);
            
            _img_icon.frame = CGRectMake(W/2 -_img_icon.dy_W/2, _contentEdgeInsets.top, _img_icon.dy_W, _img_icon.dy_H);
            _lbl_title.frame = CGRectMake(_contentEdgeInsets.left, _img_icon.dy_B +15, txtW, textSize.height);
        }
            break;
            
        case WLAlertStyle_Custom: {
            
            W = _cus_size.width;
            H = _cus_size.height;
        }
            break;
            
        default:
            break;
    }
    
    self.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/2 -W/2, UIScreen.mainScreen.bounds.size.height/2 -H/2,  W, H);
}




#pragma mark -

- (void)pri_hideAllComps {
    
    [_actView stopAnimating];
    _actView.hidden = YES;
    
    _img_icon.hidden = YES;
    _lbl_title.hidden = YES;
    _lbl_desc.hidden = YES;
}




#pragma mark - Getter & Setter

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
     
        _holder.layer.cornerRadius  = _cornerRadius;
        _holder.layer.masksToBounds = YES;
    }
}
- (void)setStyle:(WLAlertStyle)style {
    if (_style != style) {
        _style = style;
        
        [self pri_hideAllComps];
        
        switch (style) {
                
            //只显示文本
            case WLAlertStyle_TxtOnly: {
                
                _lbl_title.hidden   = NO;

            }
                break;
                
            //显示富文本
            case WLAlertStyle_AttrTxt: {
                
                _lbl_title.hidden   = NO;
                
            }
                break;
                
            //只显示【活动指示器】
            case WLAlertStyle_ActOnly: {
                
                [_actView startAnimating];
                _actView.hidden     = NO;
                
            }
                break;
                
            //只显示【图片】
            case WLAlertStyle_ImgOnly: {
                
                _img_icon.hidden    = NO;

            }
                break;
                
            //显示【活动指示器】和【文本】
            case WLAlertStyle_ActTxt: {
                
                _lbl_title.hidden   = NO;
                
                [_actView startAnimating];
                _actView.hidden     = NO;
                
            }
                break;
                
            //显示【图片】和【文本】
            case WLAlertStyle_ImgTxt: {
                
                _lbl_title.hidden   = NO;
                _img_icon.hidden    = NO;

            }
                break;
                
            //显示【自定义视图】
            case WLAlertStyle_Custom: {
                
                
                
            }
                break;
                
            default:
                break;
        }
    }
}
- (void)setBgStyle:(WLAlertBgStyle)bgStyle {
    if (_bgStyle != bgStyle) {
        _bgStyle = bgStyle;
        
        UIColor *txtColor = nil;
        
        switch (_bgStyle) {
                
            case WLAlertBgStyle_White: {
                
                _bg_blur.hidden = YES;
                _holder.backgroundColor = RGBA(255, 255, 255, 0.95);
                
                txtColor = RGBA(79, 79, 79, 1);
                _actView.color = UIColor.lightGrayColor;
                _lbl_title.textColor    = txtColor;
                _lbl_desc.textColor     = txtColor;
                
                self.layer.shadowColor  = RGBA(0, 0, 0, 0.5).CGColor;
                self.layer.shadowOffset = CGSizeZero;
                self.layer.shadowRadius = 5;
                self.layer.shadowOpacity = 0.2;
            }
                break;
                
            case WLAlertBgStyle_Black: {
                
                _bg_blur.hidden = YES;
                _holder.backgroundColor = RGBA(0, 0, 0, 0.95);
                
                txtColor = RGBA(255, 255, 255, 1);
                _actView.color = UIColor.whiteColor;
                _lbl_title.textColor    = txtColor;
                _lbl_desc.textColor     = txtColor;
                
            }
                break;
                
            case WLAlertBgStyle_Blur: {
                
                _bg_blur.hidden = NO;
                _holder.backgroundColor = UIColor.clearColor;
                
                _actView.color = UIColor.blackColor;
                
//                self.layer.shadowColor  = RGBA(0, 0, 0, 1).CGColor;
//                self.layer.shadowOffset = CGSizeZero;
//                self.layer.shadowRadius = 8;
//                self.layer.shadowOpacity = 0.2;
                
                //self.dy_borderWidth_black = 1;
            }
                break;
                
            default:
                break;
        }
    }
}




#pragma mark - Show & Dismiss

- (void)showWithStyle:(WLAlertStyle)style

                image:(id)image
                 text:(id)text

           customView:(UIView *)customView
                 size:(CGSize)size

         dismissDelay:(NSTimeInterval)delay
{
    self.style = style;
    
    if (_cus_view) {
        [_cus_view removeFromSuperview];
        _cus_view = nil;
    }
    
    switch (style) {
            
        case WLAlertStyle_TxtOnly: {
            _lbl_title.text = text;
            [_lbl_title sizeToFit];
        }
            break;
            
        case WLAlertStyle_AttrTxt: {
            if ([text isKindOfClass:[NSAttributedString class]]) {
                _lbl_title.text = nil;
                _lbl_title.attributedText = (NSAttributedString *)text;
                [_lbl_title sizeToFit];
            }
        }
            break;
            
        case WLAlertStyle_ActOnly: {
            
        }
            break;
            
        case WLAlertStyle_ImgOnly: {
            _img_icon.mg_image = image;
        }
            break;
            
        case WLAlertStyle_ActTxt: {
            _lbl_title.text = text;
            [_lbl_title sizeToFit];
        }
            break;
            
        case WLAlertStyle_ImgTxt: {
            _img_icon.mg_image = image;
            _lbl_title.text = text;
            [_lbl_title sizeToFit];
        }
            break;
            
        case WLAlertStyle_Custom: {
            _cus_view = customView;
            _cus_size = size;
            [customView addToView:_holder];
        }
            break;
            
        default:
            break;
    }
    [self updateFrame];
    [self dy_show:delay];
}
- (void)dy_show:(NSTimeInterval)dismissDelay {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.superview == nil) {
            
            self.alpha = 0;
            self.transform = CGAffineTransformMakeScale(1.5, 1.5);
            
            UIView *view = [UIApplication sharedApplication].keyWindow;
            [view addSubview:self];
            
            [UIView animateWithDuration:0.125 animations:^{
                
                self.alpha = 1;
                self.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
            } completion:^(BOOL finished) {
                
                self->_seconds = dismissDelay;
                [self starTimer];
                
            }];
        } else {
            
            self->_seconds = dismissDelay;
            [self starTimer];
            
        }
    });
}
- (void)wl_dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0;
            self.transform = CGAffineTransformMakeScale(0.1, 0.1);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    });
}

+ (void)showWithStyle:(WLAlertStyle)style image:(id)image text:(id)text customView:(UIView *)customView size:(CGSize)size dismissDelay:(NSTimeInterval)delay {
    [[WLAlertView sharedView] showWithStyle:style image:image text:text customView:customView size:size dismissDelay:delay];
}
+ (void)dismiss {
    [[WLAlertView sharedView] wl_dismiss];
}





#pragma mark - Timer

- (void)starTimer {
    
    if (_seconds <= 0) {
        return;
    }
    
    [self stopTimer:NO];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(action_timer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)stopTimer:(BOOL)finished {
    [_timer invalidate];
    _timer = nil;
    
    if (finished) {
        [self wl_dismiss];
    }
}
- (void)action_timer:(NSTimer *)timer {
    _seconds -= 0.05;
    
    //NSLog(@"alertView: %.1f", _seconds);
    if (_seconds < 0) {
        [self stopTimer:YES];
    }
}

@end
