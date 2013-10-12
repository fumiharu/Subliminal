//
//  SLEditingMenu.m
//  Subliminal
//
//  Created by Jeffrey Wear on 10/11/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLEditingMenu.h"
#import "SLUIAElement+Subclassing.h"

@implementation SLEditingMenu

+ (instancetype)menu {
    return [[self alloc] initWithUIARepresentation:@"UIATarget.localTarget().frontMostApp().editingMenu()"];
}

@end


@implementation SLEditingMenuItem {
    NSString *_label;
}

+ (instancetype)itemWithAccessibilityLabel:(NSString *)label {
    return [[self alloc] initWithAccessibilityLabel:label];
}

- (instancetype)initWithAccessibilityLabel:(NSString *)label {
    NSParameterAssert([label length]);

    NSString *escapedLabel = [label slStringByEscapingForJavaScriptLiteral];
    NSString *UIARepresentation = [NSString stringWithFormat:@"((function(){\
        var items = UIATarget.localTarget().frontMostApp().editingMenu().elements();"
        // the editing menu may contain multiple items with the same name (one system, one custom),
        // only one of which is actually visible in the menu (has a non-zero size),
        // so we must search through the array rather than retrieving the item by name
        @"var item = null; \
        if (items.toArray().some(function(elem) {\
            item = elem;\
            return ((elem.name() === '%@') && (elem.rect().size.width > 0));\
        })) {\
            return item;\
        } else {"
            // return whatever element the menu would have returned
            @"return items['%@'];\
        }\
    })())", escapedLabel, escapedLabel];
    self = [super initWithUIARepresentation:UIARepresentation];
    if (self) {
        _label = [label copy];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ label:\"%@\">", NSStringFromClass([self class]), _label];
}

@end
