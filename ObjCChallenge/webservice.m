//
//  webservice.m
//  jsondemo post
//
//  Created by Yogesh Patel on 08/11/17.
//  Copyright © 2017 Yogesh Patel. All rights reserved.
//

#import "webservice.h"

@implementation webservice
+(void)executequery:(NSString *) strurl strpremeter:(NSString*)premeter withblock:(void(^)(NSData *, NSError *)) block;
{
    //Step:-1 Session Create
    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];//New Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];//Queue is Stroing and retrieve data FIFO
    
    NSURL *urlrequest = [NSURL URLWithString:strurl];
    NSMutableURLRequest*mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];
    
    NSString * parm = premeter;//Method and Body
    [mutablerequest setHTTPMethod:@"GET"];//Adding Data is Url With Json
    [mutablerequest setHTTPBody:[parm dataUsingEncoding:NSUTF8StringEncoding]];//Data Encoding UTF-8
    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (data!=nil)
        {
            //printf("a");
            //NSLog(@"Response %@", data);
            block(data,error);
        }
        else
        {
            //NSLog(@"error");
            block(nil,error);
        }
    }];
    [task resume];
    
    
}

@end
