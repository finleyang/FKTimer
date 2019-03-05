//
//  NSTimer+FKCustomTimer.m
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import "NSTimer+FKCustomTimer.h"

@implementation NSTimer (FKCustomTimer)

+ (NSTimer *)fk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    void (^inBlock)(void) = [block copy];
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(fk_blockHandle:) userInfo:inBlock repeats:repeats];
}

+ (void)fk_blockHandle:(NSTimer *)timer
{
    if (timer.userInfo) {
        void(^block)(void) = (void (^)(void))timer.userInfo;
        block();
    }
}

@end
