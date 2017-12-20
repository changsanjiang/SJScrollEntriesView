//
//  ViewController.m
//  SJScrollEntriesViewProject
//
//  Created by BlueDancer on 2017/9/4.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "ViewController.h"

#import "SJScrollEntriesView.h"

#import "SampleModel.h"

#import <Masonry.h>


@interface ViewController (SJScrollEntriesViewDelegateMethods)<SJScrollEntriesViewDelegate>

@end


@implementation ViewController (SJScrollEntriesViewDelegateMethods)

- (void)scrollEntriesView:(SJScrollEntriesView *)view currentIndex:(NSInteger)currentIndex beforeIndex:(NSInteger)beforeIndex {
    NSLog(@"currentIndex : %zd - beforeIndex : %zd", currentIndex, beforeIndex);
}

@end


@interface ViewController ()

@property (nonatomic, strong, readwrite) SJScrollEntriesView *scrollEntriesView;

@end

@implementation ViewController

@synthesize scrollEntriesView = _scrollEntriesView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

//    SJScrollEntriesViewSettings *settings = [SJScrollEntriesViewSettings new];
//    settings.fontSize = 14;
//    settings.itemScale = 1.2;
//    settings.selectedColor = [UIColor redColor];
//    settings.normalColor = [UIColor blackColor];
//    settings.lineColor = [UIColor redColor];
//    settings.lineHeight = 2;
////    settings.itemSpacing = 32;
//    settings.lineScale = 0.382;
//    settings.maxWidth = [UIScreen mainScreen].bounds.size.width;

    _scrollEntriesView = [[SJScrollEntriesView alloc] initWithSettings:nil];
    
    _scrollEntriesView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_scrollEntriesView];
    
    [_scrollEntriesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.offset(0);
        make.height.offset(44);
        make.center.offset(0);
    }];
    
    _scrollEntriesView.delegate = self;
    
    
#pragma mark - Items
    NSMutableArray <SampleModel *> *itemsM = [NSMutableArray new];
    for ( int i = 0 ; i < 5; i ++ ) {
        SampleModel *model = [SampleModel modelWithTitle:[NSString stringWithFormat:@"%zd", arc4random() % 1000]];
        [itemsM addObject:model];
    }
    
    _scrollEntriesView.items = itemsM;

    // Do any additional setup after loading the view, typically from a nib.
}

@end
