//
//  RSSFeedTableViewManger.m
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import "RSSFeedTableViewManger.h"
#import "RSSFeedTableViewCell.h"
#import "RSSNewsEntity.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface RSSFeedTableViewManger()

@property (nonatomic, strong) NSArray *newsList;
@property (nonatomic, strong) NSMutableSet *tappedRows;

@end

@implementation RSSFeedTableViewManger

- (void)updateTableViewWithNewsList:(NSArray *)newsList {
    self.newsList = newsList;
    self.tappedRows = [NSMutableSet new];
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
    
    RSSNewsEntity *news = [self.newsList objectAtIndex:indexPath.row];
    
    if ([self.tappedRows containsObject:@(indexPath.row)]) {
        cell.titleView.text = news.shortDescription;
    } else {
        cell.titleView.text = news.title;
    }
    cell.sourceView.text = news.newsSource;
    
    UIImage *placeholder;
    
    if ([news.newsSource containsString:@"lenta"]) {
        placeholder = [UIImage imageNamed:@"lenta"];
    } else {
        placeholder = [UIImage imageNamed:@"gazetaru"];
    }
    
    [cell.myImageView sd_setImageWithURL:news.imageURL placeholderImage:placeholder];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RSSFeedTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    RSSNewsEntity *news = [self.newsList objectAtIndex:indexPath.row];
    
    if ([self.tappedRows containsObject:@(indexPath.row)]) {
        [self.tappedRows removeObject:@(indexPath.row)];
         cell.titleView.text = news.shortDescription;
    } else {
        [self.tappedRows addObject:@(indexPath.row)];
        cell.titleView.text = news.title;
    }
    [tableView reloadData];
}

@end
