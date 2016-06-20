//
//  RSSFeedServerResponseMapperTest.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RSSFeedServerResponseMapper.h"
#import "RSSNewsEntity.h"

@interface RSSFeedServerResponseMapperTest : XCTestCase

@property (nonatomic, strong) RSSFeedServerResponseMapper *mapper;

@end

@implementation RSSFeedServerResponseMapperTest

- (void)setUp {
    [super setUp];
    
    self.mapper = [RSSFeedServerResponseMapper new];
}

- (void)tearDown {
    self.mapper = nil;
    
    [super tearDown];
}

- (void)testSuccessMapServerResponse {
    // given
    NSString *resPath = [[NSBundle bundleForClass:[self class]]resourcePath];
    NSData *data = [NSData dataWithContentsOfFile:[resPath stringByAppendingPathComponent:@"testMapping.xml"]];
    
    // when
    NSArray *res = [self.mapper mapServerResponse:data error:nil];
    
    // then
    XCTAssertNotNil(res);
    XCTAssertEqual(res.count, 1);
    
    RSSNewsEntity *news1 = [res objectAtIndex:0];
    
    XCTAssertEqualObjects([news1 class], [RSSNewsEntity class]);
    XCTAssertNotNil(news1.title);
    XCTAssertNotNil(news1.shortDescription);
    XCTAssertNotNil(news1.newsSource);
    XCTAssertNotNil(news1.date);
}

@end
