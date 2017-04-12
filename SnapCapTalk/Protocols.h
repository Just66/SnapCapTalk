//
//  Protocols.h
//  SnapCapTalk
//
//  Created by Dmytro Aprelenko on 11.04.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

#ifndef Protocols_h
#define Protocols_h
@protocol AVCamCameraVCDelegate <NSObject>

-(void)shouldEnableControls:(BOOL)enable;
-(void)shouldEnableRecord:(BOOL)enable;

-(void)recordingHasStarted;
-(void)recordingCanStart;

@end

#endif /* Protocols_h */
