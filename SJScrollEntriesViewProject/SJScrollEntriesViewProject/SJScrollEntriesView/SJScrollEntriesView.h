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

@protocol SJScrollEntriesViewDelegate;

@interface SJScrollEntriesView : UIView

@property (nonatomic, strong, readwrite) NSArray<id<SJScrollEntriesViewUserProtocol>> *items;

- (void)settings:(void(^)(SJScrollEntriesViewSettings *settings))block;

- (void)changeIndex:(NSInteger)index;

@property (nonatomic, weak) id <SJScrollEntriesViewDelegate> delegate;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@end

@protocol SJScrollEntriesViewDelegate <NSObject>

@optional
- (void)scrollEntriesView:(SJScrollEntriesView *)view currentIndex:(NSInteger)currentIndex beforeIndex:(NSInteger)beforeIndex;

@end





@interface SJScrollEntriesViewSettings : NSObject

@property (nonatomic, assign) float fontSize;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *lineColor;

@end
