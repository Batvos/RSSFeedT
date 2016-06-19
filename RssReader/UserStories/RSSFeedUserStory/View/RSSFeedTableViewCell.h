//
//  RSSFeedTableViewCell.h
//  RssReader
//
//  Created by Batvos on 19/06/2016.
//  Copyright © 2016 Batvos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSFeedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *sourceView;

@end
