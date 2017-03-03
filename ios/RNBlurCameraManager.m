//
//  RNBlurCameraManager.m
//  RNBlurCamera
//
//  Created by Abhishek Chadha on 3/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RNBlurCameraManager.h"
#import "RNBlurCamera.h"

@implementation RNBlurCameraManager : RCTViewManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;


- (UIView *)view
{
    
    RNBlurCamera* b = [[RNBlurCamera alloc] initWithEventDispatcher:_bridge];
    return b;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


RCT_EXPORT_VIEW_PROPERTY(blurEnabled, BOOL);
RCT_EXPORT_VIEW_PROPERTY(blurRadius, NSNumber);
RCT_EXPORT_METHOD(getSnapshot:(RCTResponseSenderBlock)callback) {
    [((RNBlurCamera*) (self.view)) getScreenshot:^(NSString * res, NSError * err) {
        callback(@[err ? err : [NSNull null], res ? res : @""]);
    }];
}

@end

