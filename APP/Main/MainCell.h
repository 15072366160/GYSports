//
//  MainCell.h
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MaSportModel.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const MainCellID = @"MainCell";

@interface MainCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bkView;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (weak, nonatomic) IBOutlet UIButton *starBtn;

@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (nonatomic, strong) MaSportModel *model;

- (IBAction)starBtnAction:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
