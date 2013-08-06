//
//  AppDelegate.h
//  RouletteSpinner
//
//  Created by Jared Bergman on 7/16/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet AppController *controller;

@end
