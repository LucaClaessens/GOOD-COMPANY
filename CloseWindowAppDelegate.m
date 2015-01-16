//
//  CloseWindowAppDelegate.m
//  NotificationMountain
//
//  Created by ☝LUCA☝ on 13-12-14.
//  Copyright (c) 2014 Gabriel Pierannunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CloseWindowAppDelegate.h"

@implementation CloseWindowAppDelegate

@synthesize window;

- (IBAction)openSecondWindow:(id)sender {
    secondNib = [[NSNib alloc] initWithNibNamed:@"success" bundle:nil];
    [secondNib instantiateNibWithOwner:self topLevelObjects:nil];
    [secondWindow makeKeyAndOrderFront:nil];
    
}

- (IBAction)closeSecondWindow:(id)sender {
    [secondWindow close];
    
}

@end