//
//  ViewController.m
//  FKTimer
//
//  Created by Finley on 2019/3/5.
//  Copyright © 2019 finley. All rights reserved.
//

#import "ViewController.h"
#import "FKTimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)nextButtonClick:(id)sender {
    FKTimerViewController *vc = [[FKTimerViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
