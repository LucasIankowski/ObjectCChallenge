//
//  webservice.m
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 25/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import "webservice.h"

@implementation webservice

+(void) executequery:(NSString *) strurl strpremeter: (NSString *)premeter withblock:(void (NSData *, NSError *))block
{
    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *urlrequest = [NSURL URLWithString:strurl];
    NSMutableURLRequest *mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];
    
    NSString *parm = premeter;
    [mutablerequest setHTTPMethod:@"GET"];
    [mutablerequest setHTTPBody:[parm dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:(NSData *data, NSURLResponse * response, NSError *error){
        if (data!=nil)
        {
            NSLog(@"Response %@", data);
            block(data, error);
        }
        else
        {
            NSLog(@"Error");
            block(nil, error)
        }
    }];
    [task resume];
}

@end
