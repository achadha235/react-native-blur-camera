//
//  RNBlurCamera.h
//  RNBlurCamera
//
//  Created by Abhishek Chadha on 3/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "GPUImage.h"
#import <UIKit/UIKit.h>
#import "RCTViewManager.h"

@interface RNBlurCamera : UIView
@property (nonatomic, strong) RCTEventDispatcher* eventDispatcher;
@property (nonatomic, strong) UILabel* labelView;

@property (nonatomic, strong) GPUImageVideoCamera* videoCamera;
@property (nonatomic, strong) GPUImageGaussianBlurFilter* filter;
@property (nonatomic, strong) GPUImageMovieWriter* movieWriter;
@property (nonatomic, strong) GPUImageView* filterView;

@property (nonatomic, strong) GPUImageStillCamera*  stillCamera;
@property (nonatomic, strong) GPUImageGaussianBlurFilter* blurFilter;
@property (nonatomic, strong) GPUImageView *captureImageView;

@property (nonatomic, strong) NSNumber* blurRadius;
@property BOOL blurEnabled;


- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;
- (void) getScreenshot: (void(^)(NSString*, NSError*)) cb ;

@end
