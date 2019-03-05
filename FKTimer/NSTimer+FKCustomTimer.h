//
//  NSTimer+FKCustomTimer.h
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (FKCustomTimer)

+ (NSTimer *)fk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
