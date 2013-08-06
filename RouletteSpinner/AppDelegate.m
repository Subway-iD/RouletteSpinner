//
//  AppDelegate.m
//  RouletteSpinner
//
//  Created by Jared Bergman on 7/16/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize controller;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask
                                          handler: ^NSEvent *(NSEvent *event){
                                              if ([event keyCode] == 49) {
                                                  [controller spin:self];
                                              }
                                              
                                              return event;
                                              
    }];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return TRUE;
}



@end
