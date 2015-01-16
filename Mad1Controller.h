//
//  Mad1Controller.h
//  NotificationMountain
//
//  Created by ☝LUCA☝ on 02-01-15.
//  Copyright (c) 2015 Gabriel Pierannunzi. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@interface Mad1Controller : NSWindowController {
    
}


@property (strong,retain)IBOutlet NSWindowController *controller;
@property (strong,retain)IBOutlet NSWindowController *controllerrandom;
@property (weak) IBOutlet NSProgressIndicator *progressBar;

@end