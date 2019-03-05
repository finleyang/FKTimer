//
//  FKProxy.m
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import "FKProxy.h"

@implementation FKProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
