//
//  RSSFeedTableViewMangerTest.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RSSFeedTableViewManger.h"
#import "RSSFeedUserStoryViewController.h"
#import "RSSNewsEntity.h"
#import "RSSFeedTableViewCell.h"
#import <OCMock/OCMock.h>

@interface RSSFeedTableViewMangerTest : XCTestCase

@property (nonatomic, strong) RSSFeedTableViewManger *tableViewManager;

@end

@implementation RSSFeedTableViewMangerTest

- (void)setUp {
    [super setUp];
    
    self.tableViewManager = [[RSSFeedTableViewManger alloc] init];
}

- (void)tearDown {
    self.tableViewManager = nil;
    
    [super tearDown];
}

- (void)testSuccessUpdateTableViewWithNewsList {
    // given
    NSArray *newsList = @[];
    id mockViewController = OCMClassMock([RSSFeedUserStoryViewController class]);
    self.tableViewManager.delegate = mockViewController;
    
    // when
    [self.tableViewManager updateTableViewWithNewsList:newsList];
    
    // then
    OCMVerify([mockViewController didUpdateTableView]);
}

#pragma mark - Test UITableViewDataSource methods

- (void)testThatReturnsCorrectNumberOfSection {
    // given
    NSArray *newsList = @[];
    NSUInteger const ExpectedNumberOfSection = 1;
    id mockViewController = OCMClassMock([RSSFeedUserStoryViewController class]);

    // when
    [self.tableViewManager updateTableViewWithNewsList:newsList];
    
    // then
    XCTAssertEqual([self.tableViewManager numberOfSectionsInTableView:mockViewController], ExpectedNumberOfSection);
}

- (void)testThatReturnsCorrectNumberOfRows {
    // given
    NSArray *newsList = @[[RSSNewsEntity new], [RSSNewsEntity new], [RSSNewsEntity new]];
    NSUInteger const ExpectedNumberOfRow = 3;
    id mockViewController = OCMClassMock([RSSFeedUserStoryViewController class]);
    
    // when
    [self.tableViewManager updateTableViewWithNewsList:newsList];
    
    // then
    XCTAssertEqual([self.tableViewManager tableView:mockViewController numberOfRowsInSection:1], ExpectedNumberOfRow);
    
}

- (void)testThatReturnsCorrectTypeOfCell {
    // given
    NSArray *newsList = @[[RSSNewsEntity new], [RSSNewsEntity new], [RSSNewsEntity new]];
    RSSFeedUserStoryViewController *mockViewController = OCMClassMock([RSSFeedUserStoryViewController class]);
    UITableView *mockUITableView = OCMClassMock([UITableView class]);
    mockViewController.tableView = mockUITableView;
    NSUInteger expectedNumberOfCellForParticularCellClass = newsList.count;
    NSUInteger actualNumberOfCellForParticularCellClass = 0;
    
    OCMStub([mockUITableView dequeueReusableCellWithIdentifier:OCMOCK_ANY forIndexPath:OCMOCK_ANY]).andReturn([RSSFeedTableViewCell new]);
    
    // when
    [self.tableViewManager updateTableViewWithNewsList:newsList];
    NSUInteger numberOfRows = [self.tableViewManager tableView:mockViewController.tableView numberOfRowsInSection:0];
    
    for (int i = 0; i < numberOfRows; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableViewManager tableView:mockUITableView cellForRowAtIndexPath:indexPath];
        
        if ([cell isKindOfClass:[RSSFeedTableViewCell class]]) {
            actualNumberOfCellForParticularCellClass++;
        }
    }
    
    // then
    XCTAssertEqual(actualNumberOfCellForParticularCellClass, expectedNumberOfCellForParticularCellClass);
}

@end
