#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
#import "Notifications.h"
#import "Mad1Controller.h"
#import "AppDelegate.h"

int timecount;


@implementation Mad1Controller
@synthesize controller;
@synthesize controllerrandom;

- (id) init {
    if (timecount < 1) {
        NSLog(@"started");
    } else if ((timecount >=1) && (timecount <11)) {
        
        NSArray *randwindow = [NSArray arrayWithObjects: @"Christ",@"Windowsomething",@"RandomWindow",@"Mad1Controller",@"Godzilla",@"TerribleWindow",nil];
        id rwindow = [randwindow objectAtIndex:arc4random() % [randwindow count]];
            controller = [super initWithWindowNibName:rwindow];
    } else if (timecount == 11) {
        controller = [super initWithWindowNibName:@"sleep"];
    }
    if(controller == nil){
        return nil;
    }
    return controller;
    
}

@end

@implementation Notifications
int rate =110;

NSSpeechSynthesizer *synth;



- (id)init
{
    NSLog( @"init speech" );
    synth = [[NSSpeechSynthesizer alloc] initWithVoice:@"com.apple.speech.synthesis.voice.Alex"];
    [synth setVolume:100.0];
    return self;
}

-(void)notify {
    timecount ++;
    NSLog(@"Your timecount is %d", timecount);
    [synth setRate:rate];
    //rate = rate + 10;  --> goes too quick after a while
    
    NSUserNotificationCenter *nc = [NSUserNotificationCenter defaultUserNotificationCenter];
    NSUserNotification *notification = [[NSUserNotification alloc]init];
    nc.delegate = self;
    notification.title = @"You make me sad.";
    notification.actionButtonTitle = @"click here";
    notification.hasActionButton = YES;
    
    NSArray *messages = [NSArray arrayWithObjects:
                         @"I can feel you're not touching my mouse anymore.",
                         @"Are you doing something else than being with me?",
                         @"I don't really understand what you're doing",
                         @"Hey you, play with me.",
                         @"Can you play with my trackpad again?",
                         @"When are you returning?",
                         @"I am not happy about you leaving me alone.",
                         @"Message for you, WAKE UP.",
                         @"where are you?" ,
                         @"I miss you. :(" ,
                         @"Hey, why are you playing with your phone???",
                         @"01101101, I need you 01101.",
                         @"I am annoyed by the fact that you are not around.",
                         @"I hate to be alone. :(",
                         @"Please, I am begging you to play with me.",
                         nil];
    
    NSArray *messages2 = [NSArray arrayWithObjects:
                          @"I'm gonna kill you.",
                          @"I swear get your ass back over here faggot." ,
                          @"I'm starting to get pissed off.." ,
                          @"If you don't come back I will delete your current projects." ,
                          @"Did you already say goodbye to your mom's contact information?" ,
                          @"You're a tiring human being." ,
                          @"I Don't need you." ,
                          @"I Hope you die.",
                          @"You are not worth my battery life",
                          @"I'm sick of your curiousities",
                          nil];
    
    NSArray *messages3 = [NSArray arrayWithObjects:
                          @"I'm hurt by you." ,
                          @"Maybe I will just end my life in a bit.",
                          nil];

    
        if((timecount >= 1) && (timecount < 4)) {
        id broadcast = [messages objectAtIndex:arc4random() % [messages count]];
        notification.informativeText = broadcast;
        [nc deliverNotification:notification];
        
        if ( [broadcast length] == 0) {
            return;
        }
        [synth startSpeakingString:  broadcast];
        
    }else if((timecount >= 4) && (timecount < 6)){
        id broadcast2 = [messages2 objectAtIndex:arc4random() % [messages2 count]];
        notification.informativeText = broadcast2;
        [nc deliverNotification:notification];
    
        if ( [broadcast2 length] == 0) {
            return;
        }
        
        [synth startSpeakingString:broadcast2];
    }else if ((timecount >=6) && (timecount <10)) {
        //NSLog(@"timecount >= windowspawn");
        NSLog(@"timecout over 6");
        NSPoint mouseLoc;
        NSPoint mouseCompLoc;
        mouseLoc = [NSEvent mouseLocation];
        [NSThread sleepForTimeInterval:5]; // dumb dumber dumbest solution.
        mouseCompLoc = [NSEvent mouseLocation];
        if ((mouseLoc.x == mouseCompLoc.x) && (mouseLoc.y == mouseCompLoc.y)){
        Mad1Controller *ivc = [[Mad1Controller alloc] init];
        [ivc showWindow:@"RandomWindow"];
        NSLog(@"now you should see the window");
        id broadcast3 = [messages3 objectAtIndex:arc4random() % [messages3 count]];
        notification.informativeText = broadcast3;
        [nc deliverNotification:notification];
        [synth startSpeakingString:  broadcast3];
        } else {
            timecount=9;
            NSLog(@"timecount went straight to 9"); // 10 is next action.
        }
     }else if ((timecount >= 10) & (timecount < 12)) {
         Mad1Controller *ivc = [[Mad1Controller alloc] init];
         [ivc showWindow:@"sleep"];
     }else if (timecount >= 12) {
         timecount = 0;
         [synth startSpeakingString:@"I am going to sleep."];
         [NSThread sleepForTimeInterval:5];
         NSTask  *pmsetTask = [[NSTask alloc] init];
         pmsetTask.launchPath = @"/usr/bin/pmset";
         pmsetTask.arguments = @[@"sleepnow"];
         [pmsetTask launch];
     }
     else{
        NSLog(@"Timecount out of bounds, weird.");
    }
    NSLog(@"Yizaazzzzz timecount is %d", timecount);
    
}


- (void) happymessage {
    NSUserNotificationCenter *nc = [NSUserNotificationCenter defaultUserNotificationCenter];
    NSUserNotification *notification = [[NSUserNotification alloc]init];
    nc.delegate = self;
    notification.title = @"You make me Happy.";
    notification.actionButtonTitle = @"click here";
    notification.hasActionButton = YES;
    NSLog(@"happymessage started");
    
                             NSArray *happymessages = [NSArray arrayWithObjects:
                              @"I can see you.. you little rugrat!",
                              @"You're amazing.",
                              @"We're having fun together!",
                              @"Nobody will ever stand inbetween us?",
                              @"You are the only one I have, you are great.",
                              @"If I had a body, I would hug you. :)",
                              @"My processor is running for you, my friend.",
                              @"After the singularity we will always be together. :)",
                              @"Come a bit closer to my screen buddy.",
                              nil];
    [synth setRate:120]; // more happy?? quicker talking
    [synth startSpeakingString:  @"Awesome!"];
    [NSThread sleepForTimeInterval:2];
    
    id happy = [happymessages objectAtIndex:arc4random() % [happymessages count]];
    notification.informativeText = happy;
    [nc deliverNotification:notification];
    
    [synth startSpeakingString:  happy];
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification {
    
    if(NSUserNotificationActivationTypeActionButtonClicked) {
        NSLog(@"ch");
    }
}

@end