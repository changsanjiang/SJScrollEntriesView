//
//  SampleModel.m
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SampleModel.h"

@implementation SampleModel

+ (instancetype)modelWithTitle:(NSString *)title {
    SampleModel *model = [self new];
    model.title = title;
    return model;
}

@end
