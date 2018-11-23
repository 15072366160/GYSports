//
//  MaSportModel.h
//  APP
//
//  Created by Paul on 2018/11/23.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MaSportModel : NSObject

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSString *SportName;
@property (nonatomic, copy) NSString *SportIcon;
@property (nonatomic, copy) NSString *SportContext;

@property (nonatomic, assign) NSInteger SportIndex;
@property (nonatomic, assign) NSInteger SportCount;
@property (nonatomic, assign) NSInteger SportTime;
@property (nonatomic, assign) NSInteger SportDuration;

@property (nonatomic, assign) BOOL isStart;
@property (nonatomic, assign) NSInteger starTime;
@property (nonatomic, assign) NSInteger endTime;

@end

NS_ASSUME_NONNULL_END
