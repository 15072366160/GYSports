//
//  AppDelegate.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "AppDelegate.h"

#import "MainVC.h"
#import "BaNavigationController.h"

#import "APP-Bridging-Header.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Window Root ViewController
    [self makeRootController];
    
    // 设置HUD
    [GYHUD setDefaultStyle:SVProgressHUDStyleDark];
    [GYHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [GYHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    // 建表
    // 运动类型表
    [FMDBManager shared];
    [FMDBManager createTable:SPORTKINDS fieldDict:@{SPORTNAME:FMDB_TINYTEXT,SPORTICON:FMDB_TINYTEXT,SPORTCONTEXT:FMDB_TINYTEXT,SPORTCOUNT:FMDB_INTEGER,SPORTTIME:FMDB_INTEGER,SPORTDURATION:FMDB_INTEGER}];
    // 运动数据表
    [FMDBManager createTable:SPORTNUMBER fieldDict:@{SPORTTYPE:FMDB_INTEGER,SPORTDURATION:FMDB_INTEGER,SPORTCOUNT:FMDB_INTEGER,SPORTTIME:FMDB_INTEGER,SPORTDATE:FMDB_TINYTEXT}];

    return YES;
}

#pragma mark -- Window Root ViewController
- (void)makeRootController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainVC *vc = [[MainVC alloc] init];
    BaNavigationController *nvc = [[BaNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nvc;
}

@end
