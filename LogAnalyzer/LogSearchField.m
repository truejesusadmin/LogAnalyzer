//
//  LogSearchField.m
//  LogAnalyzer
//
//  Created by Vladimír Nevyhoštěný on 16.02.15.
//  Copyright (c) 2015 Vladimír Nevyhoštěný. All rights reserved.
//

#import "LogSearchField.h"
@import Carbon;

@implementation LogSearchField

//------------------------------------------------------------------------------
- (void) keyDown:(NSEvent*)event
{
    switch ( event.keyCode ) {
        case kVK_ANSI_C:
            if ( event.modifierFlags & NSCommandKeyMask ) {
                NSString *foo = [self stringValue];
                if ( [foo length] ) {
                    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
                    [pasteboard declareTypes:[NSArray arrayWithObject: NSStringPboardType] owner: nil];
                    [pasteboard setString:foo forType:NSStringPboardType];
                }
                else {
                    [super keyDown:event];
                }
            }
            else {
                [super keyDown:event];
            }
            break;
            
        case kVK_ANSI_V:
            if ( event.modifierFlags & NSCommandKeyMask ) {
                NSString *foo = [[NSPasteboard generalPasteboard] stringForType:NSStringPboardType];
                if ( [foo length] ) {
                    [self setStringValue:foo];
                }
                else {
                    [super keyDown:event];
                }
            }
            else {
                [super keyDown:event];
            }
            break;
            
        default:
            [super keyDown:event];
    }

}


@end