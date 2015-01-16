//
//  APSettingsManager.m
//  NotificationMountain
//
//  Created by ☝LUCA☝ on 09-01-15.
//  Copyright (c) 2015 Gabriel Pierannunzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APTSettingsManager.h"
#import "APAppLauncher.h"
#import "APTDefinitions.h"

@implementation APTSettingsManager


- (BOOL)launchAtStartupState
{
    id savedStateObject = [[NSUserDefaults standardUserDefaults] objectForKey:kAutolaunchFlag];
    if (!savedStateObject) {
        [self saveLaunchAtStartupState:YES];
        return YES;
    }
    
    return [savedStateObject boolValue];
}

- (void)saveLaunchAtStartupState:(BOOL)state
{
    [APAppLauncher setLaunchAtStartup:state];
    
    [[NSUserDefaults standardUserDefaults] setBool:state forKey:kAutolaunchFlag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end

