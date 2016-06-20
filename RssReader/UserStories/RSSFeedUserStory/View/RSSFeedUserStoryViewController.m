//
//  RSSFeedUserStoryRSSFeedUserStoryViewController.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryViewController.h"
#import "RSSFeedTableViewManger.h"
#import "RSSFeedUserStoryViewOutput.h"

@interface RSSFeedUserStoryViewController () <RSSFeedTableViewMangerOutput>

@end

@implementation RSSFeedUserStoryViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 64;
    
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RSSFeedUserStoryViewInput

- (void)setupInitialState:(NSArray *)rssNewsList {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    [self updateNewsFeed:rssNewsList];
    
    self.tableView.dataSource = self.delegateAndSource;
    self.tableView.delegate = self.delegateAndSource;
    self.delegateAndSource.delegate = self;
}

- (void)updateNewsFeed:(NSArray *)newsList {
    [self.delegateAndSource updateTableViewWithNewsList:newsList];
}

#pragma mark - RSSFeedTableViewMangerOutput methods

- (void)didUpdateTableView {
    [self.tableView reloadData];
}

- (void)didTapCellWithNews:(RSSNewsEntity *)news {
    [self.output didTriggerTapCellWithNews:news];
}

@end
