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

@interface ViewController (){
    NSString *mainstr;
    NSMutableArray *arrtitle;
    NSMutableArray *arroverview;
    NSMutableArray *arrvotes;
    NSMutableArray *arrimage;
}
@end

@implementation ViewController
@synthesize movieTitle, movieOverview, movieImage, movieVotes;
- (void) requestData
{
    mainstr = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?api_key=78a787b8dde782248f42a145cf83862c&language=en-US&page=1"];
    
    [webservice executequery: mainstr strpremeter:nil] withblock:(NSData * dbdata, NSError *error){
        NSLog(@"Data: %@", dbdata);
        if (dbdata != nil){
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData: dbdata
                options: NSJSONReadingAllowFragments
                error: nil]
            NSLog(@"Response Data: %@", maindic);
            
            arrtitle = [[NSMutableArray alloc]init];
            arroverview = [[NSMutableArray alloc]init];
            arrvotes = [[NSMutableArray alloc]init];
            arrphoto = [[NSMutableArray alloc]init];
            
            NSDictionary *dic1 = [maindic objectForKey: @"results"];
            
            for (NSDictionary *dict in dic1){
                NSString *strtitle = [dict objectForKey:@"title"];
                [arrtitle addObject: strtitle];
                NSLog(@"Strtitle : %@", strtitle)
                
                NSString *stroverview = [dict objectForKey:@"overview"];
                [arroverview addObject: stroverview];
                NSLog(@"Stroverview : %@", stroverview)
                
                NSString *strvotes = [dict objectForKey:@"vote_average"];
                [arrvotes addObject: strvotes];
                NSLog(@"Strvotes : %@", strvotes)
                
                NSString *strimage = [dict objectForKey:@"poster_path"];
                [arrimage addObject: strimage];
                NSLog(@"Strimage : %@", strimage)
            }
            
            [self._tableView reloadData]
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[MainMovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.movieTitle.text = arrtitle(indexPath.row);
    cell.movieOverview.text = arroverview(indexPath.row);
    cell.movieVotes.text = arrvotes(indexPath.row);
    cell.movieImage. = arrimage(indexPath.row);
}


- ( void )viewDidLoad
{
    [super viewDidLoad];
    MenuMovie * cell1 = [[MenuMovie alloc]init];
    cell1.title = @"";
    cell1.description = @"";
    cell1.votes = @"";
    cell1.imageName = @"";
}



@end
