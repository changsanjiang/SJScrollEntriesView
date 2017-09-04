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

@interface ViewController ()

@property (nonatomic, strong, readwrite) SJScrollEntriesView *scrollEntriesView;

@end

@implementation ViewController

@synthesize scrollEntriesView = _scrollEntriesView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollEntriesView = [SJScrollEntriesView new];
    
    _scrollEntriesView.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 44);
    
    _scrollEntriesView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_scrollEntriesView];
    
    
    
    
#pragma mark - Items
    NSMutableArray <SampleModel *> *itemsM = [NSMutableArray new];
    for ( int i = 0 ; i < 20; i ++ ) {
        SampleModel *model = [SampleModel modelWithTitle:[NSString stringWithFormat:@"%zd", arc4random() % 1000]];
        [itemsM addObject:model];
    }
    
    _scrollEntriesView.items = itemsM;

    // Do any additional setup after loading the view, typically from a nib.
}

@end
