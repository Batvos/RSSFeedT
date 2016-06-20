//
//  CommonNetworkClientTest.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CommonNetworkClient.h"
#import "NetworkConstantsAndURLs.h"
#import <OCMock/OCMock.h>

@interface CommonNetworkClient ()

@property (nonatomic, strong) NSURLSession *session;

@end

@interface CommonNetworkClientTest : XCTestCase

@property (nonatomic, strong) CommonNetworkClient *networkClient;
@property (nonatomic, strong) id mockSession;

@end

@implementation CommonNetworkClientTest

- (void)setUp {
    [super setUp];
    
    self.networkClient = [[CommonNetworkClient alloc] init];
    self.mockSession = OCMClassMock([NSURLSession class]);
    self.networkClient.session = self.mockSession;
}

- (void)tearDown {
    self.networkClient = nil;
    self.mockSession = nil;
    
    [super tearDown];
}

- (void)testSuccessSendRequest {
    // given
    NSURL *url = [NSURL URLWithString:LentaURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // when
    [self.networkClient sendRequest:request completionBlock:nil];
    
    // then
    OCMVerify([self.mockSession dataTaskWithRequest:request completionHandler:OCMOCK_ANY]);
}

@end
