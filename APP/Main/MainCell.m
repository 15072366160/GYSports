//
//  MainCell.m
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bkView.layer.cornerRadius = 10;
    
    [self.starBtn setImage:@"暂停1" selImg:@"播放1"];
    
}

- (void)setModel:(MaSportModel *)model{
    _model = model;
    
    self.imgView.image = [UIImage imageNamed:model.SportIcon];
    self.nameLabel.text = model.SportName;
    self.numLabel.text = [NSString stringWithFormat:@"%ld个",model.SportCount];
    
    CGFloat duration = model.SportDuration / 60.0;
    self.durationLabel.text = [NSString stringWithFormat:@"用时：%.2lfmin",duration];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.SportTime];
    self.timeLabel.text = [fmt stringFromDate:date];
    
    
    self.starBtn.selected = model.isStart;
}

- (IBAction)starBtnAction:(UIButton *)sender {
    
    NSInteger time = [[NSDate date] timeIntervalSince1970];
    if (sender.selected == false) {
        self.model.starTime = time;
    }else{
        self.model.endTime = time;
        NSInteger space = self.model.endTime - self.model.starTime;
        self.model.SportDuration += space;
    }
    
    sender.selected = !sender.selected;
}


@end
