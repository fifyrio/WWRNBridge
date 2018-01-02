//
//  ExaminationTool.m
//  XYHiRepairs
//
//  Created by wuw on 15/12/28.
//  Copyright © 2015年 Kingnet. All rights reserved.
//

#import "ExaminationTool.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Reachability.h"

@implementation ExaminationTool
#pragma mark - Life cycle
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}
+ (ExaminationTool *)initWithData:(NSMutableArray *)data{
    static dispatch_once_t onceToken;
    static ExaminationTool *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ExaminationTool alloc] init];
        sharedInstance.data = data;
    });
    return sharedInstance;
}
//+ (ExaminationTool *)sharedInstance{
//    static dispatch_once_t onceToken;
//    static ExaminationTool *sharedInstance = nil;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[ExaminationTool alloc] init];
//    });
//    return sharedInstance;
//}

#pragma mark - Actions
- (void)selfExaminationSuccess:(void (^)(NSMutableArray *))success failure:(void (^)(NSString *))failure{
    for (int i = 0; i < self.data.count; i ++) {
        if (i == 0) {
            //麦克风
            ExaminationModel *model = [self.data objectAtIndex:i];
            AVAudioSession *session = [AVAudioSession sharedInstance];
            if (session.inputAvailable) {
                model.isWorked = YES;
            }else{
                model.isWorked = NO;
            }
            NSLog(@"");
        }else if (i == 1){
            //前置摄像头
        }else if (i == 2){
            //震动传感器
        }else if (i == 3){
            //wifi
        }else if (i == 4){
            //后置摄像头
        }else if (i == 5){
            //闪光灯
        }else if (i == 6){
            //扬声器
        }else if (i == 7){
            //听筒
        }else if (i == 8){
            //GPS
        }else if (i == 9){
            //指南针
        }else if (i == 10){
            //陀螺仪
        }else if (i == 11){
            //距离感应器
        }
    }
    success(self.data);
}
+ (BOOL)checkMicrophone{
    AVAudioSession *session = [AVAudioSession sharedInstance];
    return session.inputAvailable;
}
+ (BOOL)checkFrontCamera{
    if ([UIImagePickerController isCameraDeviceAvailable:
         UIImagePickerControllerCameraDeviceFront]) {
        return YES;
    }else{
        return NO;
    }
}
+ (void)checkVibrationSensor{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate, ^{
//            NSLog(@"振动传感器可用");
        });
    }else{
        SystemSoundID system_sound_id = kSystemSoundID_Vibrate;
        AudioServicesCreateSystemSoundID(NULL,&system_sound_id);
        AudioServicesAddSystemSoundCompletion(
                                              system_sound_id,
                                              NULL, // uses the main run loop
                                              NULL, // uses kCFRunLoopDefaultMode
                                              completionCallback, // the name of our custom callback function
                                              NULL
                                              );
        AudioServicesPlaySystemSound(system_sound_id);
    }
}
static void completionCallback (SystemSoundID  mySSID, void* data) {
    NSLog(@"振动传感器可用");
    AudioServicesRemoveSystemSoundCompletion (mySSID);
}
+ (BOOL)checkWifi{
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    if ([reach currentReachabilityStatus] == ReachableViaWiFi) {
        return YES;
    }else{
        return NO;
    }
}

//后置摄像头
+ (BOOL)checkRearCamera{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)checkFlash{
    if ([UIImagePickerController isFlashAvailableForCameraDevice:
         UIImagePickerControllerCameraDeviceRear]) {
        return YES;
    }else{
        return NO;
    }
}
+ (BOOL)checkSpeaker{
    NSError *speakerError;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:&speakerError];
    if (!speakerError) {
        return YES;
    }else{
        return NO;
    }
}

//听筒
+ (BOOL)checkReceiver{
    NSError *receiverError;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&receiverError];
    if (!receiverError) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)checkGPS{
    if ([CLLocationManager locationServicesEnabled]) {
        return YES;
    }else{
        return NO;
    }
}

//数字指南针
+ (BOOL)checkCompass{
    if ([CLLocationManager headingAvailable]) {
        return YES;
    }else{
        return NO;
    }
}

//陀螺仪
+ (BOOL)checkGyroscope{
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    if (motionManager.gyroAvailable) {
        return YES;
    }else{
        return NO;
    }
}

////距离感应器
//+ (BOOL)checkDistanceSensor{
//    
//}
#pragma mark - Getters & Setters
- (void)setData:(NSMutableArray *)data{
    _data = data;
}
@end
