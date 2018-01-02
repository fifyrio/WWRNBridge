//
//  XYConnection.m
//  XYMobileTest
//
//  Created by wuw on 2018/1/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "XYConnection.h"

@implementation XYConnection

//  必须实现
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(testName:(NSString *)name){
  NSLog(@"%@",name);
  dispatch_async(dispatch_get_main_queue(), ^{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RNOpenVC" object:@{@"name":name}];
  });
};

@end
