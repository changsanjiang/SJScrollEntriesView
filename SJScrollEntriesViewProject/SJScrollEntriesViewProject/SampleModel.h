//
//  SampleModel.h
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SJScrollEntriesViewUserProtocol.h"

@interface SampleModel : NSObject<SJScrollEntriesViewUserProtocol>

@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, assign, readwrite) BOOL isSelected;

+ (instancetype)modelWithTitle:(NSString *)title;

@end
