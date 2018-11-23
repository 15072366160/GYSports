//
//  MaCreateSportsVC.m
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaCreateSportsVC.h"
#import "MaIconVC.h"
#import "MaSportModel.h"

@interface MaCreateSportsVC ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (weak, nonatomic) IBOutlet UIView *bkView;

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (nonatomic, copy) NSString *iconName;

@end

@implementation MaCreateSportsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField jk_addBottomBorderWithColor:WHITE_COLOR width:LINE_WIDTH];
    [self.textView corRadius:5];
    [self.sureBtn corRadius:5];
    [self.bkView corRadius:10];
    
    self.title = @"添加运动项目";
    [self addLeftItemWithObj:[UIImage imageNamed:@"icon_返回"]];
}

- (IBAction)iconBtnAction:(UIButton *)sender {
    MaIconVC *vc = [[MaIconVC alloc] initWithNibName:@"MaIconVC" bundle:nil];
    WEAKSELF;
    vc.block = ^(NSString *imgName) {
        [weakSelf.iconBtn setImage:[UIImage imageNamed:imgName] forState:UIControlStateSelected];
        weakSelf.iconBtn.selected = true;
        weakSelf.iconName = imgName;
    };
    [self push:vc];
}

- (IBAction)sureBtnAction:(UIButton *)sender {
    
    if (self.iconName.length <= 0) {
        [GYHUD _showInfoWithStatus:@"请选择运动图标！"];
        return;
    }
    
    NSString *sportName = self.textField.text;
    if (sportName.length <= 0) {
        [GYHUD _showInfoWithStatus:@"请输入m运动名称！"];
        return;
    }

    // 插入数据
    NSInteger time = [[NSDate date] timeIntervalSince1970];
    BOOL isInsert = [FMDBManager insertData:SPORTKINDS fieldDict:@{SPORTNAME:sportName,SPORTICON:self.iconName,SPORTCONTEXT:self.textView.text,SPORTCOUNT:@(0),SPORTTIME:@(time),SPORTDURATION:@(0)}];
    if (isInsert) {
        [self pop];
    } else {
        [GYHUD _showErrorWithStatus:@"数据添加失败!!!"];
    }
}


@end
