//
//  AppDelegate.m
//  PasscodeDemo
//
//  Created by YoonBong Kim on 12. 7. 30..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "PasscodeViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    MainViewController *mainViewCntrlr = [[MainViewController alloc] init];
    
    self.window.rootViewController = mainViewCntrlr;
    [mainViewCntrlr release];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"passcode"]) {
        
        PasscodeViewController *passcodeViewCntrlr = [[PasscodeViewController alloc] init];
        
        UIViewController *currentViewCntrlr = self.window.rootViewController;
        
        if ([currentViewCntrlr presentedViewController]) {
            currentViewCntrlr = [currentViewCntrlr presentedViewController];
        }
        
        [currentViewCntrlr presentModalViewController:passcodeViewCntrlr animated:YES];
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
