#import "AppDelegate.h"

@implementation AppDelegate
@synthesize statusBar;
int keydown;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.settingsManager = [[APTSettingsManager alloc] init];
    self.notifications = [[Notifications alloc] init];
    [self awakeFromNib];
    
}

-(void)applicationDidFinishlaunching {
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    if (_event) {
        [NSEvent removeMonitor:_event];
        _event = nil;
    }
}

- (void)awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self.statusBar setImage:[NSImage imageNamed:kUndefinedStatusIconName]];
    self.statusBar.highlightMode = YES;
    [self.statusBar setTarget:self];
    [self.statusBar setAction:@selector(togglePopover:)];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"FirstLaunch"]) {
        //[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"FirstLaunch"];
        //to fake 1st launch.
    } else {
        NSLog(@"Something");
        [self performSelector:@selector(firstlaunch)];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"FirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
        
}

+ (void) listenForKey {
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
                                           handler:^(NSEvent *event){
                                               NSLog(@"keydown: %@", event.characters);
                                               
                                           }];
}

- (IBAction)menuAction:(id)sender {
    NSLog(@"menuAction:");
}

- (IBAction)stopnotifications:(NSButton *)sender {
    [self.statusBar setImage:[NSImage imageNamed:kUndefinedStatusIconName]];
    [mousetrack invalidate];
    [self hidePopover];
}

NSTimer *mousetrack;

-(IBAction)delivernotifications:(NSButton *)sender {
    [self performSelector:@selector(listenForKey:)];
    int mousemeasureinterval= 20;
    [mousetrack invalidate];
    mousetrack = [NSTimer scheduledTimerWithTimeInterval:mousemeasureinterval target:self selector:@selector(trackmouse) userInfo:nil repeats:YES];
    [self hidePopover];
}



-(void) trackmouse {
    int timecount = 0;
    int happypoints = 0;
    int mousecomparerinterval = 8;
    int keycount = 0;
                        
    
    NSLog(@"you have: %d happypoints", happypoints);
    NSPoint mouseLoc;
    NSPoint mouseCompLoc;
    mouseLoc = [NSEvent mouseLocation]; //get current mouse position
    NSLog(@"Mouse 1 location: %f %f", mouseLoc.x, mouseLoc.y);
    [NSThread sleepForTimeInterval:mousecomparerinterval];
    keycount ++;
    mouseCompLoc = [NSEvent mouseLocation];
    NSLog(@"Mouse 2 location: %f %f", mouseCompLoc.x, mouseCompLoc.y);
    
    
    
    if ((mouseLoc.x == mouseCompLoc.x) && (mouseLoc.y == mouseCompLoc.y)){
        [self.notifications performSelector:@selector (notify)];
        [self.statusBar setImage:[NSImage imageNamed:kSadStatusIconName]];
        keycount = 0;
        keydown = 0;
    } else if ((mouseLoc.x != mouseCompLoc.x) & (mouseLoc.y != mouseCompLoc.y) || (keycount = 0 && keydown == 1 )){
        [self.statusBar setImage:[NSImage imageNamed:kHappyStatusIconName]];
        happypoints ++;
        NSLog(@"You Moved the mouse!");
        keycount = 0;
        keydown = 0;
    }
    
    if (happypoints >= 2) {
        [self.notifications performSelector:@selector (happymessage)];
        timecount --;
        happypoints = 0;
        NSLog(@"happypoints set to %d", happypoints); //debugging
        NSLog(@"timecount -1, set to %d", timecount); // debugging
    } else if (happypoints <2) {
        NSLog (@"you have too little happypoints");
    } else {
        NSLog (@"hella weird brah");
    }
    
    
}

-(void)firstlaunch {
    NSSpeechSynthesizer *synth;
    [synth setRate: 170];
    [synth startSpeakingString:@"I see this is the first time we meet, if you want to play with me, you can find me in the navigation bar in the top, I'm a smiley, kind of."  ];
    //[self hidePopover];
}


- (IBAction)toggleAutolaunch:(NSButton *)sender
{
    [self.settingsManager saveLaunchAtStartupState:(sender.state == NSOnState)];
    if ([self.settingsManager launchAtStartupState]) {
    NSLog(@"on");
    } else {
     NSLog(@"off");
    }
}

- (IBAction)togglePopover:(id)sender
{
    [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    if ([self.popover isShown]) {
        [self hidePopover];
    } else {
        if ([self.settingsManager launchAtStartupState]) {
            [self.autolaunchSwitch setState:NSOnState];
        } else {
            [self.autolaunchSwitch setState:NSOffState];
        }
        [self.popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    }
}

- (void)hidePopover
{
    if ([self.popover isShown]) {
        [self.popover close];

}
}

@end
