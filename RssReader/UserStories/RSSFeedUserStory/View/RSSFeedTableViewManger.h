//
//  RSSFeedTableViewManger.h
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RSSNewsEntity;

@protocol RSSFeedTableViewMangerOutput <NSObject>

- (void)didUpdateTableView;
- (void)didTapCellWithNews:(RSSNewsEntity *)news;

@end

@interface RSSFeedTableViewManger : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<RSSFeedTableViewMangerOutput> delegate;

- (void)updateTableViewWithNewsList:(NSArray *)newsList;

@end
