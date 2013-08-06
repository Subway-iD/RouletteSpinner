//
//  AppController.m
//  RouletteSpinner
//
//  Created by Jared Bergman on 7/16/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import "AppController.h"

@implementation AppController

-(void)awakeFromNib {
    
    spacesColors  = @{
                      @"0":[NSColor greenColor],
                      @"1":[NSColor redColor],
                      @"2":[NSColor blackColor],
                      @"3":[NSColor redColor],
                      @"4":[NSColor blackColor],
                      @"5":[NSColor redColor],
                      @"6":[NSColor blackColor],
                      @"7":[NSColor redColor],
                      @"8":[NSColor blackColor],
                      @"9":[NSColor redColor],
                      @"10":[NSColor blackColor],
                      @"11":[NSColor blackColor],
                      @"12":[NSColor redColor],
                      @"13":[NSColor blackColor],
                      @"14":[NSColor redColor],
                      @"15":[NSColor blackColor],
                      @"16":[NSColor redColor],
                      @"17":[NSColor blackColor],
                      @"18":[NSColor redColor],
                      @"19":[NSColor redColor],
                      @"20":[NSColor blackColor],
                      @"21":[NSColor redColor],
                      @"22":[NSColor blackColor],
                      @"23":[NSColor redColor],
                      @"24":[NSColor blackColor],
                      @"25":[NSColor redColor],
                      @"26":[NSColor blackColor],
                      @"27":[NSColor redColor],
                      @"28":[NSColor blackColor],
                      @"29":[NSColor blackColor],
                      @"30":[NSColor redColor],
                      @"31":[NSColor blackColor],
                      @"32":[NSColor redColor],
                      @"33":[NSColor blackColor],
                      @"34":[NSColor redColor],
                      @"35":[NSColor blackColor],
                      @"36":[NSColor redColor],
                      @"00":[NSColor greenColor]
                      };
    
    rouletteImage = [NSImage imageNamed:@"Roullette"];
    //CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)[rouletteImage TIFFRepresentation], NULL);
    //CGImageRef img = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
    mainLayer = [CALayer layer];
    mainLayer.bounds = mainView.layer.bounds;
    mainLayer.frame = mainView.layer.bounds;
    
    CGColorRef color = CGColorCreateGenericRGB(0.0, 80.0/255.0, 13.23/255.0, 1.0);
    mainLayer.backgroundColor = color;
    CGColorRelease(color);
    
    sublayer = [CALayer layer];
    sublayer.bounds = mainView.bounds;//CGRectMake(mainView.frame.size.height/2, mainView.frame.size.height/2, mainView.frame.size.height, mainView.frame.size.width);
    sublayer.contents = rouletteImage;
    //sublayer.position = CGPointMake((mainView.frame.origin.x + (mainView.frame.size.width / 2)),
    //                                (mainView.frame.origin.y + (mainView.frame.size.height / 2)));
    
    [mainLayer addSublayer:sublayer];
    [mainView setLayer:mainLayer];
    sublayer.bounds = mainLayer.bounds;
    sublayer.frame = CGRectMake(0.0, 0.0, mainLayer.frame.size.width, mainLayer.frame.size.height);
    [mainView setWantsLayer:YES];
    [mainView setNeedsDisplay:YES];
}

-(IBAction)spin:(id)sender {
    numberHit.stringValue = @"";
    
    space = arc4random() % 38;
    spot = @"";
    if (space == 37)
        spot = @"00";
    else
        spot = [NSString stringWithFormat:@"%d",space];
    
    //[sublayer addAnimation:[self createSpinningAnimation] forKey:@"animation"];
    [sublayer addAnimation:[self createSpinningAnimation1] forKey:@"spin"];
    [spin setEnabled:NO];
}

-(void)updateLabel {
    numberHit.stringValue = spot;
    numberHit.textColor = [spacesColors objectForKey:spot];
    [spin setEnabled:YES];
}

-(CAAnimation *)createSpinningAnimation1 {
    CABasicAnimation *animation;
    
    float duration, repeat;
    duration = 0.5f;
    repeat = 3.0f;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    animation.duration = duration;
    [animation setRepeatCount:repeat];
    [animation setRemovedOnCompletion:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:duration*repeat
                                     target:self
                                   selector:@selector(updateLabel)
                                   userInfo:nil
                                    repeats:NO];
    
    return animation;
}

-(CAAnimationGroup *)createAnimationGroup {
    CAAnimationGroup *group;
    CABasicAnimation *animation1;
    
    group = [CAAnimationGroup animation];
    
    
    float duration, repeat;
    duration = 3.5f;
    repeat = 1.0f;
    
    animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation1.fromValue = [NSNumber numberWithFloat:0.0f];
    animation1.toValue = [NSNumber numberWithFloat:(360 * M_PI)/180];
    animation1.cumulative = YES;
    animation1.duration = duration;
    [animation1 setRepeatCount:repeat];
    [animation1 setRemovedOnCompletion:YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval:duration*repeat
                                     target:self
                                   selector:@selector(updateLabel)
                                   userInfo:nil
                                    repeats:NO];
    
    
    group.animations = [NSArray arrayWithObjects:animation1,nil];
    
    return group;
}

-(CAKeyframeAnimation *)createSpinningKeyframe {
    CAKeyframeAnimation *animation;
    
    
    
    return animation;
}

@end
