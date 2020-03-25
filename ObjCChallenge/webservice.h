//
//  webservice.h
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 25/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface webservice : NSObject

+(void)executequery:(NSString *) strurl strpremeter:(NSString*)premeter withblock:(void(NSData *, NSError *)) block;

@end

NS_ASSUME_NONNULL_END
