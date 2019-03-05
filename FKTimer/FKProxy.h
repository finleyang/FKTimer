//
//  FKProxy.h
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKProxy : NSProxy

@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
