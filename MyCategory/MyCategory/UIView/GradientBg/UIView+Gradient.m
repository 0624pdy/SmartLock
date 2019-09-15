//
//  UIView+Gradient.m
//  CashLoan
//
//  Created by MG_PDY on 2019/3/5.
//  Copyright © 2019 heycom.eongdu.xianjingdai. All rights reserved.
//

#import "UIView+Gradient.h"

#import "RuntimeProperty.h"

@implementation UIView (Gradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (void)load {
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method fromMethod = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
    Method toMethod = class_getInstanceMethod([self class], @selector(mg_setBackgroundColor:));
    /**
     我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(mg_setBackgroundColor:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}
- (void)mg_setBackgroundColor:(UIColor *)backgroundColor {
    if (self.bgStyle != DYBgStyle_None) {
        self.bgStyle = DYBgStyle_None;
    }
    [self mg_setBackgroundColor:backgroundColor];
}


RuntimeProperty_imp_Obj_(mg_enabledColor, setMg_enabledColor, UIColor *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(mg_disabledColor, setMg_disabledColor, UIColor *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(mg_enabledColors, setMg_enabledColors, NSArray *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(mg_disabledColors, setMg_disabledColors, NSArray *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
RuntimeProperty_imp_Obj_(mg_locations, setMg_locations, NSArray *, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
- (DYGradientDirection)mg_direction {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
- (void)setMg_direction:(DYGradientDirection)mg_direction {
    objc_setAssociatedObject(self, @selector(mg_direction), @(mg_direction), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    DYPoints points = [self pointsForDirection:mg_direction];
    self.mg_startPoint = points.startPoint;
    self.mg_endPoint   = points.endPoint;
}
RuntimeProperty_imp_NonObj_(mg_startPoint, setMg_startPoint, CGPoint)
RuntimeProperty_imp_NonObj_(mg_endPoint, setMg_endPoint, CGPoint)
- (DYBgStyle)bgStyle {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}
- (void)setBgStyle:(DYBgStyle)bgStyle {
    switch (bgStyle) {
            
        case DYBgStyle_None: {
            //self.backgroundColor = UIColor.clearColor;
            [self mg_setGradientColors:nil direction:self.mg_direction];
            self.userInteractionEnabled = YES;
        }
            break;
            
        case DYBgStyle_EnabledNormal: {
            self.backgroundColor = self.mg_enabledColor;
            [self mg_setGradientColors:nil direction:self.mg_direction];
            self.userInteractionEnabled = YES;
        }
            break;
            
        case DYBgStyle_DisabledNormal: {
            self.backgroundColor = self.mg_disabledColor;
            [self mg_setGradientColors:nil direction:self.mg_direction];
            self.userInteractionEnabled = NO;
        }
            break;
            
        case DYBgStyle_EnabledGradient: {
            //self.backgroundColor = UIColor.clearColor;
            [self mg_setGradientColors:self.mg_enabledColors direction:self.mg_direction];
            self.userInteractionEnabled = YES;
        }
            break;
            
        case DYBgStyle_DisabledGradient: {
            //self.backgroundColor = UIColor.clearColor;
            [self mg_setGradientColors:self.mg_disabledColors direction:self.mg_direction];
            self.userInteractionEnabled = NO;
        }
            break;
            
        default:
            break;
    }
}
- (void)mg_configBg:(DYBgStyle (^)(UIView *))config {
    if (config) {
        self.bgStyle = config(self);
    } else {
        self.bgStyle = DYBgStyle_None;
    }
}

- (void)mg_setGradientColors:(NSArray<UIColor *> *)colors direction:(DYGradientDirection)direction {
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        
        self.mg_direction = (direction < 0 || direction > 3) ? DYGradientDirection_Horizolal : direction;
        
        NSMutableArray *_colors = [@[] mutableCopy];
        for (UIColor *c in colors) {
            [_colors addObject:(__bridge id)c.CGColor];
        }
        
        ((CAGradientLayer *)self.layer).colors      = _colors;
//        ((CAGradientLayer *)self.layer).locations   = @[ @0, @0.8, @1 ];
        
        ((CAGradientLayer *)self.layer).startPoint  = self.mg_startPoint;
        ((CAGradientLayer *)self.layer).endPoint    = self.mg_endPoint;
    }
}

- (DYPoints)pointsForDirection:(DYGradientDirection)direction {
    
    DYPoints points;
    
    switch (direction) {
        case DYGradientDirection_Horizolal: {
            points.startPoint = CGPointMake(0, 0);
            points.endPoint   = CGPointMake(1, 0);
        }
            break;
        case DYGradientDirection_Vertical: {
            points.startPoint = CGPointMake(0, 1);
            points.endPoint   = CGPointMake(0, 0);
        }
            break;
        case DYGradientDirection_TopLeftToBottomRight: {
            points.startPoint = CGPointMake(0, 1);
            points.endPoint   = CGPointMake(1, 0);
        }
            break;
        case DYGradientDirection_TopRightToBottomLeft: {
            points.startPoint = CGPointMake(1, 1);
            points.endPoint   = CGPointMake(0, 0);
        }
            break;
            
        default:
            break;
    }
    
    return points;
}

@end

@implementation UILabel (Gradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end

@implementation UIImageView (Gradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end

