/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	View controller for camera interface.
*/

@import UIKit;
@class AVCamPreviewView;
@protocol AVCamCameraVCDelegate;

@interface AVCamCameraViewController : UIViewController
@property (nonatomic, weak)  AVCamPreviewView *_previewView;
@property (nonatomic, weak) UISegmentedControl *captureModeControl;
@property (retain) id <AVCamCameraVCDelegate> delegate;

- (void)toggleMovieRecording;
- (void)changeCamera;
- (void)toggleCaptureMode;

@end
