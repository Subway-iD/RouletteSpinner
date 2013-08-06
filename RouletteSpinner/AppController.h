//
//  AppController.h
//  RouletteSpinner
//
//  Created by Jared Bergman on 7/16/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface AppController : NSObject {
    IBOutlet NSView *mainView;
    CALayer         *mainLayer;
    CALayer         *sublayer;
    NSImage         *rouletteImage;
    
    NSDictionary *spacesColors;
    
    int space;
    NSString *spot;
    
    IBOutlet NSTextField *numberHit;
    IBOutlet NSButton *spin;
}

-(CAAnimation *)createSpinningAnimation1;
-(CAKeyframeAnimation *)createSpinningKeyframe;
-(IBAction)spin:(id)sender;
@end
