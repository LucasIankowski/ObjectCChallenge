//
//  main.m
//  ObjCChallenge
//
//  Created by Lucas Iankowski Corrêa da Silva on 16/03/20.
//  Copyright © 2020 Lucas Iankowski Corrêa da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
