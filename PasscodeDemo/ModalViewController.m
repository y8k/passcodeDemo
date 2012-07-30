//
//  ModalViewController.m
//  PasscodeDemo
//
//  Created by YoonBong Kim on 12. 7. 30..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 300.0f, 20.0f)];
    indicatorLabel.backgroundColor = [UIColor clearColor];
    indicatorLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    indicatorLabel.textColor = [UIColor blackColor];
    indicatorLabel.textAlignment = UITextAlignmentCenter;
    indicatorLabel.text = @"This is Modal View Controller";
    
    [self.view addSubview:indicatorLabel];
    [indicatorLabel release];
    
    
    UIBarButtonItem *closeBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"CLOSE" style:UIBarButtonItemStyleBordered target:self action:@selector(onClose)];
    self.navigationItem.leftBarButtonItem = closeBarButtonItem;
    [closeBarButtonItem release];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIBarButtonItem selector

- (void)onClose     {
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
