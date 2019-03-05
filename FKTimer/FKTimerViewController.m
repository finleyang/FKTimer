//
//  FKTimerViewController.m
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import "FKTimerViewController.h"
#import <objc/runtime.h>
#import "FKProxy.h"
#import "NSTimer+FKCustomTimer.h"

@interface FKTimerViewController ()

@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, strong) NSTimer *timer1;
@property (nonatomic, strong) NSTimer *timer2;
@property (nonatomic, strong) NSTimer *timer3;
@property (nonatomic, strong) NSTimer *timer4;
@property (nonatomic, strong) FKProxy *fkProxy;

@property (nonatomic, strong) id target;

@end

@implementation FKTimerViewController

- (void)dealloc
{
    // 第二种方法
//    [self invalideTimer:_timer2];

    // 第三种方法
//    [self invalideTimer:_timer3];

    NSLog(@"FKTimerViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    // 第一种方法
//    _timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:_target selector:@selector(run) userInfo:nil repeats:YES];
    // 创建定时器
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:_target selector:@selector(run) userInfo:nil repeats:YES];
    
    // 第二种方法
//    _target = [NSObject new];
//    class_addMethod([_target class], @selector(run), class_getMethodImplementation([self class], @selector(fire)), "v@:");
//    _timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:_target selector:@selector(run) userInfo:nil repeats:YES];
    
    // 第三种方法
//    _fkProxy = [FKProxy alloc];
//    _fkProxy.target = self;
//    _timer3 = [NSTimer scheduledTimerWithTimeInterval:1 target:_fkProxy selector:@selector(run) userInfo:nil repeats:YES];
    
    // 第四种方法
    __weak typeof (self) weakSelf = self;
    _timer4 = [NSTimer fk_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        [strongSelf run];
    }];
    
    // 第五种方法
//    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(run)];
//    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
//    
    
//    [self gcdTimerTest];
}

- (void)run
{
    NSLog(@"Hello");
}

#pragma mark - 第一种方法：合适的时机关闭定时器

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    if (!parent) {
        [_timer1 invalidate];
        _timer1 = nil;
    }
}

#pragma mark - 第二种方法：合适的时机关闭定时器

- (void)invalideTimer:(NSTimer *)timer
{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

// GCDTimer
- (void)gcdTimerTest {
    //  队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 设置定时的开始时间、间隔时间
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    // 设置定时器回调
    dispatch_source_set_event_handler(timer, ^{
        [self run];
    });
    // 启动定时器，默认是关闭的
    dispatch_resume(timer);
    NSLog(@"%@",timer);
    self.timer = timer;
}


@end
