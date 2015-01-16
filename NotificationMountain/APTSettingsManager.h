//
//  APTSettingsManager.h
//  NotificationMountain
//
//  Created by ☝LUCA☝ on 09-01-15.
//  Copyright (c) 2015 Gabriel Pierannunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APTSettingsManager : NSObject {
}


- (BOOL)launchAtStartupState;
- (void)saveLaunchAtStartupState:(BOOL)state;

@end