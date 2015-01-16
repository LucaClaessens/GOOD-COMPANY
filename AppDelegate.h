
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "APTDefinitions.h"
#import "APTSettingsManager.h"
#import "Notifications.h"
#import "Mad1Controller.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSPopoverDelegate>


@property (strong) IBOutlet NSSpeechSynthesizer *synth;
//@property (strong, nonatomic) APTSettingsManager *settingsManager;
@property (strong, nonatomic) Notifications *notifications;
@property (strong, nonatomic) Mad1Controller *madcontroller;
@property (strong, nonatomic) NSEvent *event;


/* UI */
@property (assign) IBOutlet NSWindow *window;
@property (readwrite, retain) IBOutlet NSMenu *menu;
@property (readwrite, retain) IBOutlet NSStatusItem *statusBar;
@property (weak) IBOutlet NSPopover *popover;
@property (weak) IBOutlet NSButton *autolaunchSwitch;
@property (weak) IBOutlet NSButton *delivernotifications;
@property (weak) IBOutlet NSButton *stopnotifications;
@property (strong) NSTimer *mousetrack;


/* ACTIONS */
- (IBAction)toggleAutolaunch:(NSButton *)sender;
- (IBAction)menuAction:(id)sender;
- (IBAction)togglePopover:(id)sender;
- (void)hidePopover;
//- (void)listenForKey;

@end