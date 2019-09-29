//
//  UITextField+WLExt.m
//  MyCategory
//
//  Created by MG_PDY on 2019/9/29.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "UITextField+WLExt.h"

#import "RuntimeProperty.h"

@implementation UITextField (WLExt)

RuntimeProperty_imp_NonObj_(isObserver, setIsObserver, BOOL)
//RuntimeProperty_imp_Obj_(block_didChangeText, setBlock_didChangeText, void(^)(UITextField *, NSString *), OBJC_ASSOCIATION_COPY_NONATOMIC)
- (void (^)(UITextField *, NSString *))block_didChangeText {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setBlock_didChangeText:(void (^)(UITextField *, NSString *))block_didChangeText {
    if (block_didChangeText) {
        objc_setAssociatedObject(self, @selector(block_didChangeText), block_didChangeText, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify_textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        
//        [self addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
        
//        [self addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
//        self.isObserver = YES;
    } else {
        objc_removeAssociatedObjects(self);
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
        
//        [self removeTarget:self action:NULL forControlEvents:UIControlEventEditingChanged];
        
//        if (self.isObserver) {
//            [self removeObserver:self forKeyPath:@"text"];
//        }
    }
}
- (void)notify_textDidChange:(NSNotification *)notify {
    if (notify.object == self) {
        if (self.block_didChangeText) {
            self.block_didChangeText(self, self.text);
        }
    }
}
- (void)textChanged {
    if (self.block_didChangeText) {
        self.block_didChangeText(self, self.text);
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        if (self.block_didChangeText) {
            self.block_didChangeText(self, self.text);
        }
    }
}

@end
