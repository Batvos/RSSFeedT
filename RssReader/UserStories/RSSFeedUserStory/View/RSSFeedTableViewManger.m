//
//  RSSFeedTableViewManger.m
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import "RSSFeedTableViewManger.h"
#import "RSSFeedTableViewCell.h"

@interface RSSFeedTableViewManger()

@property (nonatomic, strong) NSArray *newsList;

@end

@implementation RSSFeedTableViewManger

- (void)updateTableViewWithNewsList:(NSArray *)newsList {
    self.newsList = newsList;
    [self.delegate didUpdateTableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSSFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}

@end
