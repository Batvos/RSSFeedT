//
//  RSSFeedUserStoryRSSFeedUserStoryViewController.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import "RSSFeedUserStoryViewController.h"

#import "RSSFeedUserStoryViewOutput.h"

@implementation RSSFeedUserStoryViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы RSSFeedUserStoryViewInput

- (void)setupInitialState:(NSArray *)rssNewsList {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

- (void)updateNewsFeed:(NSArray *)newsList {
    
}

@end
