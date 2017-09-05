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

@property (nonatomic, assign) float fontSize;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) float lineHeight;
@property (nonatomic, assign) float lineScale;


@property (nonatomic, assign) float itemSpacing;

@end


NS_ASSUME_NONNULL_END
