//
//  BaNavigationController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "BaNavigationController.h"

@interface BaNavigationController ()

@end

@implementation BaNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationBar setTintColor:WHITE_COLOR];
    
    UIImage *img = [UIImage imageGradualOblique:MAIN_COLOR endColor:HEX_COLOR(@"FF652D") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage jk_imageWithColor:CLEAR_COLOR]];

    [self skidBack];
}


- (void)skidBack{
    //设置侧滑返回上一页
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

@end
