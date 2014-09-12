//
//  ViewController.m
//  Timer
//
//  Created by Max Xing on 8/24/14.
//  Copyright (c) 2014 Max Xing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<AVAudioPlayerDelegate>

@end

@implementation ViewController
@synthesize num;
@synthesize timer;
@synthesize seconds;
@synthesize decision;
@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    decision = YES;
    
    //play sound even in silent mode
    [[AVAudioSession sharedInstance]setCategory: AVAudioSessionCategoryPlayback error: nil];
    // The AV Audio Player needs a URL to the file that will be played to be specified.
    // So, we're going to set the audio file's path and then convert it to a URL.
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"Alarm" ofType:@"m4r"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];

    // Init the audio player.
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    // Check out what's wrong in case that the player doesn't init.
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        // In this example we'll pre-load the audio into the buffer. You may avoid it if you want
        // as it's not always possible to pre-load the audio.
        [player prepareToPlay];
        [player setDelegate:self];

    }
    
    
   // [player setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start30:(id)sender {
    
    if (decision == YES){
    seconds.text = @"30";
    num = 5;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        decision = NO;
    }}

- (IBAction)start90:(id)sender {
    if (decision == YES){
        seconds.text = @"90";
        num = 90;
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        decision = NO;
    }}

- (IBAction)start60:(id)sender {
    if (decision == YES){
        seconds.text = @"60";
        num = 60;
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        decision = NO;
    }}


- (void) countDown{
    num -= 1;
    seconds.text = [NSString stringWithFormat:@"%i", num];
    if (num == 0){
        
        seconds.text = @"Time is Up!";
     /*   CFBundleRef mainBundle = CFBundleGetMainBundle();
        CFURLRef soundfileRef;
        soundfileRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"Alarm", CFSTR("mp3"), NULL);
        UInt32 soundID;
        AudioServicesCreateSystemSoundID(soundfileRef, &soundID);
        AudioServicesPlaySystemSound(soundID);*/
        
        [player play];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [timer invalidate];
        if(!player.playing){
        decision = YES;
        }}
}

- (void) cancel:(id)sender {
    [timer invalidate];
    [player stop];
    [player setCurrentTime:0.0];
    decision = YES;
    seconds.text = @"Press to count down";
}
@end
