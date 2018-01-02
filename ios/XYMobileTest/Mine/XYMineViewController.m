//
//  XYMineViewController.m
//  XYMobileTest
//
//  Created by wuw on 2017/8/25.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "XYMineViewController.h"

@interface XYMineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.name;
}


@end
