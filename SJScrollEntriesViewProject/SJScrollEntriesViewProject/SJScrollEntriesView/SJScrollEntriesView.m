//
//  SJScrollEntriesView.m
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJScrollEntriesView.h"

#import <Masonry.h>

@interface SJScrollEntriesView ()

@property (nonatomic, strong, readwrite) NSArray<UIButton *> *itemArr;

@property (nonatomic, strong, readwrite) SJScrollEntriesViewSettings *settings;

@property (nonatomic, strong, readonly) UIView *lineView;

@property (nonatomic, assign, readwrite) NSInteger beforeIndex;

@end

@implementation SJScrollEntriesView

@synthesize scrollView = _scrollView;
@synthesize lineView = _lineView;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _setupView];
    return self;
}

- (void)changeIndex:(NSInteger)index {
    if ( _items.count == 0 ) return;
    if ( index > self.itemArr.count ) return;
    if ( index < 0 ) return;
    [self clickedBtn:self.itemArr[index]];
}

- (void)settings:(void (^)(SJScrollEntriesViewSettings *))block {
    _settings = [SJScrollEntriesViewSettings new];
    if ( block ) block(_settings);
    if ( _settings.lineColor ) {}
    if ( _settings.normalColor ) {}
    if ( _settings.selectedColor ) {}
    if ( _settings.fontSize ) {}
}

- (void)setItems:(NSArray<id<SJScrollEntriesViewUserProtocol>> *)items {
    _items = items;
    
    [self _reset];
    
    _itemArr = [self _createitems];
    
    [self _addSuviewToScrollView:_itemArr];
}

// MARK: Actions

- (void)clickedBtn:(UIButton *)btn {
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn);
        make.width.equalTo(btn).multipliedBy(0.618);
        make.bottom.offset(0);
        make.height.offset(2);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
    
    CGFloat half = CGRectGetWidth(self.frame) * 0.5;
    CGFloat offsetX = btn.center.x - half;
    if ( offsetX > _scrollView.contentSize.width - CGRectGetWidth(self.frame) ) offsetX = _scrollView.contentSize.width - CGRectGetWidth(self.frame);
    if ( offsetX < 0 ) offsetX = 0;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    if ( [self.delegate respondsToSelector:@selector(scrollEntriesView:currentIndex:beforeIndex:)] ) {
        [self.delegate scrollEntriesView:self currentIndex:btn.tag beforeIndex:self.beforeIndex];
    }
    self.beforeIndex = btn.tag;
}

// MARK: Private


- (void)_addSuviewToScrollView:(NSArray<UIButton *> *)items {
    
    if ( 0 == items.count ) return;
    
    __block CGFloat summation = 0.0;
    [items enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_scrollView addSubview:obj];
        float width = [self sizeFortitle:self.items[idx].title size:CGSizeMake(100, 50)].width + 32;
        summation += width;
        if ( idx == 0 ) {
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.leading.offset(0);
                make.bottom.equalTo(self);
                make.width.offset(width);
            }];
        }
        else {
            UIButton *beforeObj = items[idx - 1];
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(beforeObj);
                make.width.offset(width);
                make.leading.equalTo(beforeObj.mas_trailing);
            }];
        }
    }];
    
    _scrollView.contentSize = CGSizeMake(summation, self.frame.size.height);
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(items.firstObject);
        make.width.equalTo(items.firstObject).multipliedBy(0.618);
        make.bottom.offset(0);
        make.height.offset(2);
    }];
}

- (CGSize)sizeFortitle:(NSString *)title size:(CGSize)size {
    CGSize result;
    if ( [title respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)] ) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        CGRect rect = [title boundingRectWithSize:size
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [title sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return result;
}

- (NSArray<UIButton *> *)_createitems {
    NSMutableArray<UIButton *> *itemsM = [NSMutableArray new];
    [self.items enumerateObjectsUsingBlock:^(id<SJScrollEntriesViewUserProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        itemsM[idx] = [self _createButtonWithTitle:obj.title index:idx];
    }];
    return itemsM;
}

- (void)_reset {
    [_itemArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    _itemArr = nil;
}

- (UIButton *)_createButtonWithTitle:(NSString *)title index:(NSInteger)index {
    UIButton *btn = [UIButton new];
    btn.tag = index;
    [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return btn;
}

// MARK: UI

- (void)_setupView {
    [self addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:NSLayoutFormatAlignAllLeading metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
    [self addSubview:self.lineView];
}

- (UIScrollView *)scrollView {
    if ( _scrollView ) return _scrollView;
    _scrollView = [UIScrollView new];
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    return _scrollView;
}

- (UIView *)lineView {
    if ( _lineView ) return _lineView;
    _lineView = [UIView new];
    _lineView.backgroundColor = [UIColor blackColor];
    return _lineView;
}

@end


@implementation SJScrollEntriesViewSettings @end
