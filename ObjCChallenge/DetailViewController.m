//
//  DetailViewController.m
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 27/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize imageDetail, titleDetail, categoryDetail, overviewDetail;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleDetail.text = self.titleName;
    overviewDetail.text = self.overviewName;
    NSString *urlDaImagem = self.imageName;
    
    NSString *varyingString1 = @"https://image.tmdb.org/t/p/w500";
    NSString *varyingString2 = urlDaImagem;
    NSString *urlstr = [NSString stringWithFormat: @"%@%@", varyingString1, varyingString2];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlstr]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self->imageDetail.image = [UIImage imageWithData: data];
        });
    });
    
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
