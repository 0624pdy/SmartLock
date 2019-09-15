//
//  UITextView+Placeholder.m
//  PDYDemos
//
//  Created by MG_PDY on 2019/5/9.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UITextView+Placeholder.h"

#import <objc/runtime.h>

@implementation UITextView (Placeholder)

- (NSString *)dy_placeholder {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setDy_placeholder:(NSString *)dy_placeholder {
    
    objc_setAssociatedObject(self, @selector(dy_placeholder), dy_placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILabel *placeholderLabel = [self valueForKey:@"_placeholderLabel"];
    if (placeholderLabel == nil) {
        // _placeholderLabel
        placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.text = @"请输入内容";
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.textColor = [UIColor lightGrayColor];
        [placeholderLabel sizeToFit];
        placeholderLabel.font = self.font;
        [self addSubview:placeholderLabel];
        
        [self setValue:placeholderLabel forKey:@"_placeholderLabel"];
    }
    placeholderLabel.text = dy_placeholder;
}

@end
