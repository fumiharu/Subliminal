//
//  SLEditingMenu.h
//  Subliminal
//
//  Created by Jeffrey Wear on 10/11/13.
//  Copyright (c) 2013 Inkling. All rights reserved.
//

#import "SLStaticElement.h"

/**
 The singleton `SLEditingMenu` instance allows you to manipulate your application's editing menu
 --the menu that shows commands like Cut, Copy, and Paste when the user selects text.
 */
@interface SLEditingMenu : SLStaticElement

/**
 Returns an element representing the application's editing menu.
 
 @return An element representing the application's editing menu.
 */
+ (instancetype)menu;

@end


/**
 Instances of `SLEditingMenuItem` refer to items shown by the application's editing menu.
 */
@interface SLEditingMenuItem : SLStaticElement

/**
 Creates and returns an element which represents the menu item with the specified label.
 
 This is the designated initializer for a menu item.
 
 @param label The item's accessibility label.
 @return A newly created element representing the menu item with the specified label.
 */
+ (instancetype)itemWithAccessibilityLabel:(NSString *)label;

@end
