//
//  RSSFeedUserStoryRSSFeedUserStoryInteractorTests.m
//  RssReader
//
//  Created by batvos on 19/06/2016.
//  Copyright © 2016 ramba. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RSSFeedUserStoryInteractor.h"
#import "RSSFeedService.h"
#import "RSSFeedUserStoryInteractorOutput.h"

@interface RSSFeedUserStoryInteractorTests : XCTestCase

@property (nonatomic, strong) RSSFeedUserStoryInteractor *interactor;
@property (nonatomic, strong) id<RSSFeedService> feedService;
@property (nonatomic, strong) id mockOutput;


@end

@implementation RSSFeedUserStoryInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[RSSFeedUserStoryInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(RSSFeedUserStoryInteractorOutput));
    self.feedService = OCMProtocolMock(@protocol(RSSFeedService));
    self.interactor.output = self.mockOutput;
    self.interactor.rssFeddService = self.feedService;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов RSSFeedUserStoryInteractorInput

- (void)testSuccessObtainRSSFeed {
    // given
    NSObject *news = [NSObject new];
    NSArray *rssFeed = @[news];
    
    OCMStub([self.feedService obtainRSSFeddFromCache]).andReturn(rssFeed);
    
    // when
    NSArray *result = [self.interactor obtainRSSFeed];
    
    // then
    XCTAssertNotNil(result);
}

- (void)testSuccessUpdateRSSFeed {
    // given
    NSObject *news = [NSObject new];
    NSArray *rssFeed = @[news];
    
    OCMStub([self.feedService updateRSSFeedUsingSuccessBlock:OCMOCK_ANY failure:OCMOCK_ANY]).andDo(^(NSInvocation *invocation){
        void(^successBlock)(id data);
        
        [invocation getArgument:&successBlock atIndex:2];
        
        successBlock(rssFeed);
    });
    
    // when
    [self.interactor updateRSSFeed];
    
    // then
    OCMVerify([self.mockOutput didUpdateRSSFeed:OCMOCK_ANY]);
}

@end
