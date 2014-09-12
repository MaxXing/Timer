//
//  ViewController.h
//  Timer
//
//  Created by Max Xing on 8/24/14.
//  Copyright (c) 2014 Max Xing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *seconds;
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic, retain) AVAudioPlayer *player;

@property int num;
@property bool decision;

- (IBAction)start30:(id)sender;
- (IBAction)start90:(id)sender;
- (IBAction)start60:(id)sender;
- (IBAction)cancel:(id)sender;
@end
