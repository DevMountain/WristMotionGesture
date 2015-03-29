//
//  ViewController.h
//  WristMotionGestures
//
//  Created by Ontario Britton on 3/27/15.
//  Copyright (c) 2015 Ontario Britton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreMotion/CoreMotion.h"

@interface ViewController : UIViewController
{
    CMMotionManager* _motionManager;
}

@end

