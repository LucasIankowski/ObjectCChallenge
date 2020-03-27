//
//  MainMovieCell.h
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 24/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainMovieCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UITextView *movieOverview;
@property (strong, nonatomic) IBOutlet UILabel *movieVotes;
@property (strong, nonatomic) IBOutlet UIImageView *movie;

@end



NS_ASSUME_NONNULL_END
