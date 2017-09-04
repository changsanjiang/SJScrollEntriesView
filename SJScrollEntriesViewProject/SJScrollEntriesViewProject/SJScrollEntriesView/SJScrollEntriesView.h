//
//  SJScrollEntriesView.h
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJScrollEntriesViewUserProtocol.h"

@class SJScrollEntriesViewSettings;

@interface SJScrollEntriesView : UIView

@property (nonatomic, strong, readwrite) NSArray<id<SJScrollEntriesViewUserProtocol>> *items;

- (void)settings:(void(^)(SJScrollEntriesViewSettings *settings))block;

@end







@interface SJScrollEntriesViewSettings : NSObject

@property (nonatomic, assign) float fontSize;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *lineColor;

@end
