//
//  RSSNewsEntity.h
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSNewsEntity : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, copy) NSString *newsSource;
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, strong) NSDate *date;

@end
