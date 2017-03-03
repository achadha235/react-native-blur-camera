//
//  RNBlurCamera.m
//  RNBlurCamera
//
//  Created by Abhishek Chadha on 3/1/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RNBlurCamera.h"

@implementation RNBlurCamera: UIView

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if ((self = [super init])) {
        _eventDispatcher = eventDispatcher;
        
        GPUImageStillCamera* stillCamera = [[GPUImageStillCamera alloc] init];
        GPUImageGaussianBlurFilter* filter = [[GPUImageGaussianBlurFilter alloc] init];
        GPUImageView *fv = [[GPUImageView alloc]init];
        
        [self setStillCamera:stillCamera];
        [self setCaptureImageView:fv];
        [self setBlurFilter:filter];
        
    }
    return self;
}

#pragma mark - React View Management
- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
    RCTLogError(@"image cannot have any subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    RCTLogError(@"image cannot have any subviews");
    return;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    UIView* containerView = [[UIView alloc]initWithFrame:self.bounds];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    GPUImageView* containerView = [[GPUImageView alloc] initWithFrame:screenBounds];
    self.clipsToBounds = YES;
    [self addSubview: containerView];

    GPUImageVideoCamera* vc = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
    vc.outputImageOrientation = UIInterfaceOrientationPortrait;
    vc.horizontallyMirrorFrontFacingCamera = YES;
    vc.horizontallyMirrorRearFacingCamera = NO;
    
    GPUImageGaussianBlurFilter* filter = [[GPUImageGaussianBlurFilter alloc] init];
    
    // Camera -> Filter
    if ([self blurEnabled]){
        [filter setBlurRadiusInPixels:[_blurRadius floatValue]];
    } else {
        [filter setBlurRadiusInPixels: 0.0];
    }
    [vc addTarget: filter];

    // Filter -> FilterView
    GPUImageView *filterView = (GPUImageView *) containerView;
    [filter addTarget:filterView];
    
    [self setVideoCamera: vc];
    [self setFilter:filter];
    [self setFilterView:filterView];
    
    [vc startCameraCapture];
}

- (void) getScreenshot: (void(^)(NSString*, NSError*)) cb {
    [[self videoCamera] stopCameraCapture];

    GPUImageStillCamera* stillCamera = [self stillCamera];
    stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    GPUImageGaussianBlurFilter* filter = [self blurFilter];
    // Camera -> Filter
    if ([self blurEnabled]){
        [filter setBlurRadiusInPixels:[_blurRadius floatValue]];
    } else {
        [filter setBlurRadiusInPixels: 0.0];
    }
    
    [stillCamera addTarget:filter];
    GPUImageView *fv = [self captureImageView];
    [filter addTarget:fv];
    
    [stillCamera startCameraCapture];
    [stillCamera capturePhotoAsPNGProcessedUpToFilter:filter withOrientation:UIImageOrientationUp withCompletionHandler:^(NSData *processedImageData, NSError *error){
        NSData *dataForPNGFile = processedImageData;
        NSString* b = [dataForPNGFile base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSError *error2 = nil;
        NSString * imagePath = [documentsDirectory stringByAppendingPathComponent:@"FilteredPhoto.jpg"];
        if (![dataForPNGFile writeToFile:imagePath options:NSAtomicWrite error:&error2])
        {
            cb(nil, error2);
            return;
        } else {
            cb(imagePath, nil);
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
