//
//  RLKWatchDog.h
//  WatchDogDemo
//
//  Created by Realank on 2017/2/24.
//  Copyright © 2017年 Realank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLKWatchDog : NSObject

+ (instancetype)watchDogWithTimeout:(NSTimeInterval)timeInterval;

- (void)startWithTimeoutBlock:(void(^)())timeoutBlock;
- (void)feed;
- (void)stop;

@end
