# WWRNBridge
ReactNative与原生通信的demo

# 使用方法
1. ```npm i```
2. ```npm start run_iOS```

# ReactNative与原生如何通信
##1. 从原生组件传递属性到React Native（原生->RN）
通过RCTRootView将属性传给RN

iOS代码如下
```
NSDictionary *props = @{@"desc":@"hello, fuck you"};
RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"XYMobileTest"
                                               initialProperties:props
                                                   launchOptions:nil];
MainViewController* vc = [[MainViewController alloc] init];
vc.view = rootView;
```

##2. 从React Native传递属性到原生组件（RN->原生）
###2.1 iOS做如下修改
* 引入```#import <React/RCTBridgeModule.h>```以及```<RCTBridgeModule>```协议
* 必须实现```RCT_EXPORT_MODULE()```方法
* 设置你自定义的方法
```
RCT_EXPORT_METHOD(testName:(NSString *)name){
  NSLog(@"%@",name);
};
```
###2.2 JS做如下修改
* 引入```import { NativeModules } from 'react-native';```
* 使用OC中定义的方法
```
let connection = NativeModules.XYConnection;
connection.testName('Will');
```


