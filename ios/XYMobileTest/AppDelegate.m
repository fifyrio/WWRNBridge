/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "MainViewController.h"
#import "XYMineViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
  NSDictionary *props = @{@"desc":@"hello, fuck you"};
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"XYMobileTest"
                                               initialProperties:props
                                                   launchOptions:nil];
  
  MainViewController* vc = [[MainViewController alloc] init];
  vc.view = rootView;
  
  UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
  self.window.rootViewController = navVC;
  self.nav = navVC;
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openVCByRN:) name:@"RNOpenVC" object:nil];
  
  [self.window makeKeyAndVisible];
  return YES;
}


/**
 通过RN打开原生的界面
 */
- (void)openVCByRN:(NSNotification *)notification{
  XYMineViewController *vc = [[XYMineViewController alloc] init];
  vc.name = notification.userInfo[@"name"];
  [self.nav pushViewController:vc animated:YES];
}

@end
