//
//  SJScrollEntriesView.h
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJScrollEntriesViewUserProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class SJScrollEntriesViewSettings;

@protocol SJScrollEntriesViewDelegate;

@interface SJScrollEntriesView : UIView

@property (nonatomic, strong, readwrite) NSArray<id<SJScrollEntriesViewUserProtocol>> *items;

- (void)changeIndex:(NSInteger)index;

@property (nonatomic, weak) id <SJScrollEntriesViewDelegate> delegate;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

- (instancetype)initWithSettings:(SJScrollEntriesViewSettings *__nullable)settings;

@end

@protocol SJScrollEntriesViewDelegate <NSObject>

@optional
- (void)scrollEntriesView:(SJScrollEntriesView *)view currentIndex:(NSInteger)currentIndex beforeIndex:(NSInteger)beforeIndex;

@end




@interface SJScrollEntriesViewSettings : NSObject
/// default is 14
@property (nonatomic, assign) float fontSize;
/// default is redColor
@property (nonatomic, strong) UIColor *selectedColor;
/// default is blackColor
@property (nonatomic, strong) UIColor *normalColor;
/// default is 1.3
@property (nonatomic, assign) float itemScale;
/// default is red
@property (nonatomic, strong) UIColor *lineColor;
/// default is 2
@property (nonatomic, assign) float lineHeight;
/// defualt is 0.382
@property (nonatomic, assign) float lineScale;
/// default is 32
@property (nonatomic, assign) float itemSpacing;
@end


NS_ASSUME_NONNULL_END

