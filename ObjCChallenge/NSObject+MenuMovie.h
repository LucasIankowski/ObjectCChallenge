//
//  NSObject+MenuMovie.h
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 23/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MenuMovie)
@property(strong, nonatomic)NSString *title;
@property(strong, nonatomic)NSString *description;
@property(strong, nonatomic)NSString *votes;
@property(strong, nonatomic)NSString *imageName;
@end

NS_ASSUME_NONNULL_END
