//
//  RSSFeedServerResponseMapper.m
//  RssReader
//
//  Created by Batvos on 20/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import "RSSFeedServerResponseMapper.h"
#import "RSSNewsEntity.h"

static NSString * const ChannelElementName = @"channel";
static NSString * const ItemElementName = @"item";
static NSString * const TitleElementName = @"title";
static NSString * const DescriptionElementName = @"description";
static NSString * const EnclosureElementName = @"enclosure";
static NSString * const URLAttrName = @"url";
static NSString * const PubDateElementName = @"pubDate";

@interface RSSFeedServerResponseMapper ()<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *newsList;
@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, assign) NSString *parentElement;
@property (nonatomic, strong) RSSNewsEntity *currentNews;
@property (nonatomic, strong) NSString *source;

@end

@implementation RSSFeedServerResponseMapper

- (id)mapServerResponse:(id)data error:(NSError *__autoreleasing *)error {
    self.newsList = [[NSMutableArray alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
    
    return self.newsList;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:ChannelElementName]) {
        self.parentElement = ChannelElementName;
    }
    else if ([elementName isEqualToString:ItemElementName]) {
        RSSNewsEntity *news = [RSSNewsEntity new];
        [self.newsList addObject:news];
        self.currentNews = news;
        self.parentElement = ItemElementName;
        self.currentNews.newsSource = self.source;
    }
    else if ([elementName isEqualToString:EnclosureElementName]) {
        NSURL *url = [NSURL URLWithString:[attributeDict objectForKey:URLAttrName]];
        self.currentNews.imageURL =url;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (self.currentString == nil) {
        self.currentString = [[NSMutableString alloc] init];
    }
    [self.currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:ItemElementName]) {
        self.parentElement = nil;
    }
    [self.currentString setString:[self.currentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    if ([self.parentElement isEqualToString:ItemElementName]) {
        
        if ([elementName isEqualToString:TitleElementName]) {
            self.currentNews.title = self.currentString;
        } else if ([elementName isEqualToString:DescriptionElementName]) {
            self.currentNews.shortDescription = self.currentString;
        } else if ([elementName isEqualToString:PubDateElementName]) {
            self.currentNews.date = [self formatStringDateFromRSS:self.currentString];
        }
    }
    else if ([self.parentElement isEqualToString:ChannelElementName]) {
        
        if ([elementName isEqualToString:TitleElementName]) {
            self.source = self.currentString;
        }
    }
    
    self.currentString = nil;
}

- (NSDate *)formatStringDateFromRSS:(NSString *)dateStr {
    // format - Mon, 20 Jun 2016 21:28:04 +0300
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, dd MMM YYYY HH:mm:ss Z"];
    
    return [formatter dateFromString:dateStr];;
}

@end
