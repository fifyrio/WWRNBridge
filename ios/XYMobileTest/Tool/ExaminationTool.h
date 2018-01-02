//
//  ExaminationTool.h
//  XYHiRepairs
//
//  Created by wuw on 15/12/28.
//  Copyright © 2015年 Kingnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExaminationModel.h"

@interface ExaminationTool : NSObject
@property (retain, nonatomic) NSMutableArray *data;

+ (ExaminationTool *)initWithData:(NSMutableArray *)data;
- (void)selfExaminationSuccess:(void (^)(NSMutableArray *))success failure:(void (^)(NSString *))failure;//自检程序

+ (BOOL)checkMicrophone;
+ (BOOL)checkFrontCamera;
+ (void)checkVibrationSensor;
+ (BOOL)checkWifi;
+ (BOOL)checkRearCamera;
+ (BOOL)checkFlash;
+ (BOOL)checkSpeaker;
+ (BOOL)checkReceiver;
+ (BOOL)checkGPS;
+ (BOOL)checkCompass;
+ (BOOL)checkGyroscope;
+ (BOOL)checkDistanceSensor;


@end
