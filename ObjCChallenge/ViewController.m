//
//  ViewController.m
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 16/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import "ViewController.h"
#import "MenuMovie.h"
@interface ViewController ()

@end

@implementation ViewController

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
