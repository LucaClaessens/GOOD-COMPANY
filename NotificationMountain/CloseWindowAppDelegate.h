//
//  CloseWindowAppDelegate.h
//  NotificationMountain
//
//  Created by ☝LUCA☝ on 13-12-14.
//  Copyright (c) 2014 Gabriel Pierannunzi. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface CloseWindowAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSWindow * secondWindow;
    NSNib * secondNib;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)openSecondWindow:(id)sender;

- (IBAction)closeSecondWindow:(id)sender;

@end
