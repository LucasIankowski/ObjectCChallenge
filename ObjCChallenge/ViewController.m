//
//  ViewController.m
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 16/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import "ViewController.h"
#import "webservice.h"
#import "MainMovieCell.h"
#import "MenuMovie.h"

@interface ViewController (){
    NSString *mainstr;
    NSMutableArray *arrtitle;
    NSMutableArray *arroverview;
    NSMutableArray *arrvotes;
    NSMutableArray *arrimage;
    
}
@end

@implementation ViewController
- ( void )viewDidLoad
{
    [super viewDidLoad];
    
    [self requestData];
    
}


- (void) requestData
{
    mainstr = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?api_key=78a787b8dde782248f42a145cf83862c&language=en-US&page=1"];
    
    [webservice executequery: mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error){
        NSLog(@"Data: %@", dbdata);
        if (dbdata != nil){
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData: dbdata
                options: NSJSONReadingAllowFragments error: nil];
            NSLog(@"Response Data: %@", maindic);
            
            self->arrtitle = [[NSMutableArray alloc]init];
            self->arroverview = [[NSMutableArray alloc]init];
            self->arrvotes = [[NSMutableArray alloc]init];
            self->arrimage = [[NSMutableArray alloc]init];
            
            NSDictionary *dic1 = [maindic objectForKey: @"results"];
            
            for (NSDictionary *dict in dic1){
                NSString *strtitle = [dict objectForKey:@"title"];
                [self->arrtitle addObject: strtitle];
                NSLog(@"Strtitle : %@", strtitle);
                
                NSString *stroverview = [dict objectForKey:@"overview"];
                [self->arroverview addObject: stroverview];
                NSLog(@"Stroverview : %@", stroverview);
                
                NSString *strvotes = [dict objectForKey:@"vote_average"];
                [self->arrvotes addObject: strvotes];
                NSLog(@"Strvotes : %@", strvotes);
                
                NSString *strimage = [dict objectForKey:@"poster_path"];
                [self->arrimage addObject: strimage];
                NSLog(@"Strimage : %@", strimage);
            }
            
            [self.tableView reloadData];
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[MainMovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.movieTitle.text = arrtitle[indexPath.row];
    cell.movieOverview.text = arroverview[indexPath.row];
    cell.movieVotes.text = arrvotes[indexPath.row];
    //cell.movieImage. = arrimage(indexPath.row);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}



- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (void)updateFocusIfNeeded {
    
}

@end
