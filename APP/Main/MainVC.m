//
//  ViewController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MainVC.h"
#import "MainCell.h"

#import "MainHeaderView.h"
#import "MaCreateSportsVC.h"

#import "MaSportModel.h"

#import "MaSportVC.h"

@interface MainVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation MainVC

- (NSMutableArray *)list{
    if (_list == nil) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:true animated:animated];
    
    [self reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:false animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BK"]];
        bkView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:bkView];
    [bkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerWithNibName:MainCellID];
    
    MainHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"MainHeaderView" owner:nil options:nil].firstObject;
    self.tableView.tableHeaderView = headerView;
    [headerView.btn addTarget:self action:@selector(addSportKindsAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addSportKindsAction{
    MaCreateSportsVC *vc = [[MaCreateSportsVC alloc] initWithNibName:@"MaCreateSportsVC" bundle:nil];
    [self push:vc];
}

- (void)reloadData{
    NSArray *arr = [FMDBManager selectedData:SPORTKINDS fieldKyes:@[SPORTID,SPORTNAME,SPORTICON,SPORTCONTEXT,SPORTCOUNT,SPORTTIME,SPORTDURATION]];
    self.list = [MaSportModel mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:MainCellID forIndexPath:indexPath];
    cell.model = self.list[indexPath.row];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    MaSportModel *model;
    if (cell.starBtn.selected == true) {
        
        [cell starBtnAction:cell.starBtn];
        
        model = self.list[indexPath.row];
        
        // 更新时长
        [FMDBManager updateData:SPORTKINDS filedDict:@{SPORTTIME:@([[NSDate date] timeIntervalSince1970]),SPORTDURATION:@(model.SportDuration)} key:SPORTID value:model.sid];
    }
    
    MaSportVC *vc = [[MaSportVC alloc] initWithNibName:@"MaSportVC" bundle:nil];
    vc.model = model;
    [self push:vc];
}


@end
