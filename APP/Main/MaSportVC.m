//
//  MaSportVC.m
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaSportVC.h"

@interface MaSportVC ()

@end

@implementation MaSportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"运动记录";
    [self addLeftItemWithObj:[UIImage imageNamed:@"icon_返回"]];
    
    [self addRightItemWithObj:[UIImage imageNamed:@"记录"]];
}

- (void)rightItme:(id)rightItem{
    
}

@end
