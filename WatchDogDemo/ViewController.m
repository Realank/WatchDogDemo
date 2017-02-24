//
//  ViewController.m
//  WatchDogDemo
//
//  Created by Realank on 2017/2/24.
//  Copyright © 2017年 Realank. All rights reserved.
//

#import "ViewController.h"
#import "RLKWatchDog.h"

@interface ViewController ()

@property (nonatomic, strong) RLKWatchDog* watchdog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _watchdog = [RLKWatchDog watchDogWithTimeout:5];
}


- (IBAction)start:(id)sender {
    [_watchdog startWithTimeoutBlock:^{
        NSLog(@"timeout");
    }];
}

- (IBAction)feed:(id)sender {
    [_watchdog feed];
}

- (IBAction)stop:(id)sender {
    [_watchdog stop];
}

@end
