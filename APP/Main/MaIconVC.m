//
//  MaIconVC.m
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaIconVC.h"
#import "MaIconItem.h"

@interface MaIconVC ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,copy) NSArray *list;

@end

@implementation MaIconVC

- (NSArray *)list{
    if (_list == nil) {
        _list = APP_INFO[@"AppIconList"];
    }
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择图标";
    [self addLeftItemWithObj:[UIImage imageNamed:@"icon_返回"]];
    
    
    // 注册 collectionView
    [self.collectionView registerWithNibName:MaIconItemID];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MaIconItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:MaIconItemID forIndexPath:indexPath];
    
    item.imgView.image = [UIImage imageNamed:self.list[indexPath.row]];
    return item;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self pop];
    if (self.block) {
        self.block(self.list[indexPath.row]);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat w = (self.view.width - 40) / 3.0;
    return CGSizeMake(w, w);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(12, 12, 12, 12);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 8;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 8;
}

@end
