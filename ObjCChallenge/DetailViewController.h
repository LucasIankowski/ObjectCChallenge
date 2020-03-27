//
//  DetailViewController.h
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 27/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (nonatomic, strong) NSString *imageName;
@property (strong, nonatomic) IBOutlet UILabel *titleDetail;
@property (nonatomic, strong) NSString *titleName;
@property (strong, nonatomic) IBOutlet UITextView *categoryDetail;
@property (nonatomic, strong) NSString *categoryName;
@property (strong, nonatomic) IBOutlet UITextView *overviewDetail;
@property (nonatomic, strong) NSString *overviewName;



@end

NS_ASSUME_NONNULL_END
