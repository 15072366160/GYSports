//
//  MaIconItem.h
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const MaIconItemID = @"MaIconItem";

@interface MaIconItem : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

NS_ASSUME_NONNULL_END
