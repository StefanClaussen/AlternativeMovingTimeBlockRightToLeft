//
//  ViewController.m
//  230914
//
//  Created by Stefan Claussen on 23/09/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint position;
    UIView *blockOfTime;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    blockOfTime = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    [blockOfTime setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:blockOfTime];
    
    NSLog(@"%@",[self currentTimeAsAString]);
    NSLog(@"%@",[self pomodoroFinishTime]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stop:(UIButton *)sender
{
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
}

- (IBAction)start:(UIButton *)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:(1)
                                             target: self selector: @selector(onTimer)
                                           userInfo: nil
                                            repeats:YES];
}

-(void)onTimer
{
    if (blockOfTime.frame.origin.x > 20)
    {
        blockOfTime.center = CGPointMake(blockOfTime.center.x+position.x, blockOfTime.center.y+position.y);
        position = CGPointMake(-10.0, 0.0);
    }
}

#pragma -mark - Figuring out the current time

- (NSString *)currentTimeAsAString
{
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"HH:mm:ss"];
    return [DateFormatter stringFromDate:[NSDate date]];
}

- (NSString *)pomodoroFinishTime
{
    NSDate *completionTime = [[NSDate date] dateByAddingTimeInterval:25*60];
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"HH:mm:ss"];
    return [DateFormatter stringFromDate:completionTime];
}

@end
