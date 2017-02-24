//
//  RLKWatchDog.m
//  WatchDogDemo
//
//  Created by Realank on 2017/2/24.
//  Copyright © 2017年 Realank. All rights reserved.
//

#import "RLKWatchDog.h"
@interface RLKWatchDog ()

@property (nonatomic, assign)NSTimeInterval timeInterval;
@property (nonatomic, strong)NSTimer* watchdogTimer;
@property (nonatomic, copy) void(^timeoutBlock)();

@end

@implementation RLKWatchDog

+ (instancetype)watchDogWithTimeout:(NSTimeInterval)timeInterval{
    RLKWatchDog* watchdog = [[self alloc] init];
    watchdog.timeInterval = timeInterval;
    return watchdog;
}

- (void)disableTimer{
    if (_watchdogTimer) {
        [_watchdogTimer invalidate];
        _watchdogTimer = nil;
    }
}

- (void)startWithTimeoutBlock:(void(^)())timeoutBlock{
    self.timeoutBlock = timeoutBlock;
    [self disableTimer];
    self.watchdogTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(watchDogTimeout) userInfo:nil repeats:NO];
}
- (void)feed{
    if (self.watchdogTimer) {
        [self startWithTimeoutBlock:self.timeoutBlock];
    }
    
}
- (void)stop{
    [self disableTimer];
    self.timeoutBlock = nil;
}

- (void)watchDogTimeout{
    [self disableTimer];
    if (self.timeoutBlock) {
        self.timeoutBlock();
        self.timeoutBlock = nil;
    }
}

@end
