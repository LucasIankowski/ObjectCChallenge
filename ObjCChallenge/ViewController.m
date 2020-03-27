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
#import "MainTitleCell.h"
#import "DetailViewController.h"
@interface ViewController (){
    NSString *mainstr;
    NSMutableArray *arrtitle;
    NSMutableArray *arroverview;
    NSMutableArray *arrvotes;
    NSMutableArray *arrimage;
    
    NSMutableArray *arrtitle2;
    NSMutableArray *arroverview2;
    NSMutableArray *arrvotes2;
    NSMutableArray *arrimage2;
}
@end

@implementation ViewController

- ( void )viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 180;
    
    [self requestData];
    [self requestData2];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        
        if (indexPath.row < 3) {
            destViewController.titleName = [arrtitle objectAtIndex:indexPath.row-1];
            destViewController.overviewName = [arroverview objectAtIndex:indexPath.row-1];
            destViewController.imageName = [arrimage objectAtIndex:indexPath.row-1];
        }else{
        destViewController.titleName = [arrtitle2 objectAtIndex:indexPath.row-4];
        destViewController.overviewName = [arroverview2 objectAtIndex:indexPath.row-4];
        destViewController.imageName = [arrimage2 objectAtIndex:indexPath.row-4];
        }
    }
}


- (void) requestData
{
    mainstr = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/popular?api_key=78a787b8dde782248f42a145cf83862c&language=en-US&page=1"];
    //printf("entrou aqui 1");
    [webservice executequery: mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error){
        //NSLog(@"Data: %@", dbdata);
        if (dbdata != nil){
            //printf("entrou aqui 2");
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData: dbdata
                options: NSJSONReadingAllowFragments error: nil];
            //NSLog(@"Response Data: %@", maindic);
            
            self->arrtitle = [[NSMutableArray alloc]init];
            self->arroverview = [[NSMutableArray alloc]init];
            self->arrvotes = [[NSMutableArray alloc]init];
            self->arrimage = [[NSMutableArray alloc]init];
            
            NSDictionary *dic1 = [maindic objectForKey: @"results"];
            
            for (NSDictionary *dict in dic1){
                NSString *strtitle = [dict objectForKey:@"title"];
                [self->arrtitle addObject: strtitle];
                //NSLog(@"Strtitle : %@", strtitle);
                
                NSString *stroverview = [dict objectForKey:@"overview"];
                [self->arroverview addObject: stroverview];
                //NSLog(@"Stroverview : %@", stroverview);
                
                NSString *strvotes = [dict objectForKey:@"vote_average"];
                [self->arrvotes addObject: strvotes];
                //NSLog(@"Strvotes : %@", strvotes);
                
                NSString *strimage = [dict objectForKey:@"poster_path"];
                [self->arrimage addObject: strimage];
                //NSLog(@"Strimage : %@", strimage);
            }
            //printf("AQUI");
            [self.tableView reloadData];
        }
    }];
}

- (void) requestData2
{
    mainstr = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?api_key=78a787b8dde782248f42a145cf83862c&language=en-US&page=1"];
    //printf("entrou aqui 1");
    [webservice executequery: mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error){
        //NSLog(@"Data: %@", dbdata);
        if (dbdata != nil){
            //printf("entrou aqui 2");
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData: dbdata
                options: NSJSONReadingAllowFragments error: nil];
            //NSLog(@"Response Data: %@", maindic);
            
            self->arrtitle2 = [[NSMutableArray alloc]init];
            self->arroverview2 = [[NSMutableArray alloc]init];
            self->arrvotes2 = [[NSMutableArray alloc]init];
            self->arrimage2 = [[NSMutableArray alloc]init];
            
            NSDictionary *dic1 = [maindic objectForKey: @"results"];
            
            for (NSDictionary *dict in dic1){
                NSString *strtitle = [dict objectForKey:@"title"];
                [self->arrtitle2 addObject: strtitle];
                //NSLog(@"Strtitle : %@", strtitle);
                
                NSString *stroverview = [dict objectForKey:@"overview"];
                [self->arroverview2 addObject: stroverview];
                //NSLog(@"Stroverview : %@", stroverview);
                
                NSString *strvotes = [dict objectForKey:@"vote_average"];
                [self->arrvotes2 addObject: strvotes];
                //NSLog(@"Strvotes : %@", strvotes);
                
                NSString *strimage = [dict objectForKey:@"poster_path"];
                [self->arrimage2 addObject: strimage];
                //NSLog(@"Strimage : %@", strimage);
            }
            
            [self.tableView reloadData];
        }
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 3) {
        return 40.0f;
    }else{
        return 195.0f;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //printf("aaa");
    if (indexPath.row == 0) {
        MainTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"title"];
        if (cell == nil){
            cell = [[MainTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"title"];
        }
        cell.menuTitle.text = @"Popular Movies";
        return cell;
    }
    if (indexPath.row == 1 || indexPath.row == 2) {
        MainMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil){
            cell = [[MainMovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.movieTitle.text = arrtitle[indexPath.row-1];
        cell.movieOverview.text = arroverview[indexPath.row-1];
        NSString *textVote = arrvotes[indexPath.row-1];
        printf("%s", textVote);
        //cell.movieVotes.text = textVote;
        
        NSString *varyingString1 = @"https://image.tmdb.org/t/p/w500";
        NSString *varyingString2 = arrimage[indexPath.row-1];
        NSString *urlstr = [NSString stringWithFormat: @"%@%@", varyingString1, varyingString2];
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlstr]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.movie.image = [UIImage imageWithData: data];
            });
        });
        return cell;
    }
    if (indexPath.row == 3) {
        MainTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"title"];
        if (cell == nil){
            cell = [[MainTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"title"];
        }
        cell.menuTitle.text = @"Now Playing";
        return cell;
    }
    if (indexPath.row >= 4) {
        MainMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil){
            cell = [[MainMovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.movieTitle.text = arrtitle2[indexPath.row-4];
        cell.movieOverview.text = arroverview2[indexPath.row-4];
        //cell.movieVotes.text = arrvotes2[indexPath.row];
        NSString *varyingString1 = @"https://image.tmdb.org/t/p/w500";
        NSString *varyingString2 = arrimage2[indexPath.row-4];
        NSString *urlstr = [NSString stringWithFormat: @"%@%@", varyingString1, varyingString2];
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlstr]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.movie.image = [UIImage imageWithData: data];
            });
        });
        return cell;
    }
    MainTitleCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"title"];
    return cell2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
