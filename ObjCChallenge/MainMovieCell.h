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
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UITextView *movieOverview;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieVotes;

@end

NS_ASSUME_NONNULL_END
