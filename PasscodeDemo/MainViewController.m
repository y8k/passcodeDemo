//
//  MainViewController.m
//  PasscodeDemo
//
//  Created by YoonBong Kim on 12. 7. 30..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"
#import "PasscodeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)loadView
{
    [super loadView];

    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel *indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 300.0f, 20.0f)];
    indicatorLabel.backgroundColor = [UIColor clearColor];
    indicatorLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    indicatorLabel.textColor = [UIColor blackColor];
    indicatorLabel.textAlignment = UITextAlignmentCenter;
    indicatorLabel.text = @"This is Main View Controller";
    
    [self.view addSubview:indicatorLabel];
    [indicatorLabel release];
    
    
    UIButton *modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    modalButton.frame = CGRectMake(10.0f, 300.0f, 300.0f, 44.0f);
    
    [modalButton setTitle:@"MODAL" forState:UIControlStateNormal];
    [modalButton addTarget:self action:@selector(onModal) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:modalButton];
    
    
    UIButton *passwordSettingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    passwordSettingButton.frame = CGRectMake(10.0f, 360.0f, 300.0f, 44.0f);
    
    [passwordSettingButton setTitle:@"SET PASSWORD" forState:UIControlStateNormal];
    [passwordSettingButton addTarget:self action:@selector(onPassword) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:passwordSettingButton];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIButton selector

- (void)onModal {
    
    ModalViewController *modalViewCntrlr = [[ModalViewController alloc] init];
    UINavigationController *modalNavigationCntrlr = [[UINavigationController alloc] initWithRootViewController:modalViewCntrlr];
    
    [self presentModalViewController:modalNavigationCntrlr animated:YES];
    [modalViewCntrlr release];
    [modalNavigationCntrlr release];
    
}


- (void)onPassword  {
    
    PasscodeViewController *passcodeViewCntrlr = [[PasscodeViewController alloc] init];
    passcodeViewCntrlr.title = @"Change Passcode";
    passcodeViewCntrlr.isEnterMode = YES;
    
    UINavigationController *passcodeNavigationCntrlr = [[UINavigationController alloc] initWithRootViewController:passcodeViewCntrlr];
    
    [self presentModalViewController:passcodeNavigationCntrlr animated:YES];
    
    [passcodeViewCntrlr release];
    [passcodeNavigationCntrlr release];
    
}

@end
