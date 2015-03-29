//
//  ViewController.m
//  WristMotionGestures
//
//  Created by Ontario Britton on 3/27/15.
//  Copyright (c) 2015 Ontario Britton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *dotView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _motionManager = [CMMotionManager new];
    if( _motionManager.isDeviceMotionAvailable){
        [self setupDeviceMotion];
    }
}

- (void) setupDeviceMotion
{
    [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        CMAttitude *attitude = motion.attitude;
        float xOffSet = self.view.frame.size.width/2.0 * -attitude.yaw * 1.2;
        float yOffset = self.view.frame.size.height/2.0 * -attitude.pitch * 1.2;
        _dotView.center = CGPointMake(self.view.center.x + xOffSet, self.view.center.y + yOffset);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
