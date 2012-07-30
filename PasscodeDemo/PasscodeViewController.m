//
//  PasscodeViewController.m
//  PasscodeDemo
//
//  Created by YoonBong Kim on 12. 7. 30..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import "PasscodeViewController.h"

@interface PasscodeViewController ()

- (void)setPasscodeLabel:(NSInteger)length;

@end

@implementation PasscodeViewController

@synthesize isEnterMode = _isEnterMode;


- (id)init
{
    self = [super init];
    if (self) {

        _enteredPasscode = [[NSMutableString alloc] init];
    }
    return self;
}


- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 30.0f, 320.0f, 160.0f)];
    _backgroundView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_backgroundView];
    [_backgroundView release];
    
    {
        
        _explanationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 300.0f, 30.0f)];
        _explanationLabel.backgroundColor = [UIColor clearColor];
        _explanationLabel.font = [UIFont boldSystemFontOfSize:24.0f];
        _explanationLabel.textColor = [UIColor darkGrayColor];
        _explanationLabel.text = NSLocalizedString(@"Enter Passcode", nil);
        
        [_backgroundView addSubview:_explanationLabel];
        
        
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 30.0f, 300.0f, 20.0f)];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.font = [UIFont systemFontOfSize:14.0f];
        _statusLabel.textColor = [UIColor grayColor];
        
        [_backgroundView addSubview:_statusLabel];
        
        
        NSInteger tag = 400;
        CGPoint point = CGPointMake(24.0f, 80.0f);
        for (NSUInteger idx = 0; idx < 4; idx++)    {
            
            UILabel *passcodeEntryLabel = [[UILabel alloc] initWithFrame:CGRectMake(point.x, point.y, 50.0f, 50.0f)];
            passcodeEntryLabel.tag = tag;
            passcodeEntryLabel.backgroundColor = [UIColor whiteColor];
            passcodeEntryLabel.font = [UIFont boldSystemFontOfSize:30.0f];
            passcodeEntryLabel.textColor = [UIColor blackColor];
            passcodeEntryLabel.textAlignment = UITextAlignmentCenter;
            
            [_backgroundView addSubview:passcodeEntryLabel];
            
            point.x += 75.0f;
            tag += 10;
        }
    }
    

    _hiddenTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _hiddenTextField.delegate = self;
    _hiddenTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addSubview:_hiddenTextField];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"ksdjflksdjfklsjdflkjsdlfkjsdlkfjsdlkfjlksj");
    
    _statusLabel.text = (_isEnterMode)? @"Enter 4 digit passcode what you want." : @"Enter 4 digit passcode what you setted.";
    
    
    _hiddenTextField.text = @"";
    [self setPasscodeLabel:0];
    
    if (_isEnterMode) {
        
        UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancel)];
        self.navigationItem.rightBarButtonItem = cancelBarButtonItem;
        [cancelBarButtonItem release];
        
    }
    
    [_hiddenTextField becomeFirstResponder];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setPasscodeLabel:(NSInteger)length    {
    
    NSInteger tag = 400;
    for (NSInteger idx = 0; idx < 4; idx ++)    {
        
        UILabel *passcodeEntryLabel = (UILabel *)[self.view viewWithTag:tag];
        
        if (idx < length) {
            passcodeEntryLabel.text = @"●";
        }
        else    {
            passcodeEntryLabel.text = @"";
        }
        
        tag += 10;
    }
    
}


#pragma mark - UIBarButtonItem selector

- (void)onCancel    {
    
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - UITextField delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string    {
    
    NSString *passcode = [textField text];
    passcode = [passcode stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"passcode : %@", passcode);
    
    [self setPasscodeLabel:[passcode length]];
    
    if ([passcode length] == 4) {
        
        /* if this view controller is passcode changing (editing) mode */
        if (_isEnterMode) {
            
            /* same as previous entered passcode */
            if ([_enteredPasscode isEqualToString:passcode]) {
                
                [[NSUserDefaults standardUserDefaults] setObject:_enteredPasscode forKey:@"passcode"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [self dismissModalViewControllerAnimated:YES];
                
                
            }
            
            else    {
                
                /* it's verify (2nd) view controllers */
                if ([_enteredPasscode length] > 0) {
                    
                    _statusLabel.text = @"Passcode is not same as before.";
                    _hiddenTextField.text = @"";
                    
                    [self setPasscodeLabel:0];
                    
                }
                
                /* it's 1st view controllers that you want to change passcode */
                else    {
                    
                    [_enteredPasscode setString:passcode];
                    
                    [UIView animateWithDuration:0.3f animations:^{
                        
                        _backgroundView.transform = CGAffineTransformMakeTranslation(-320.0f, 0.0f);
                    } completion:^(BOOL finished) {
                        
                        _backgroundView.transform = CGAffineTransformMakeTranslation(640.0f, 0.0f);
                        
                        _statusLabel.text = @"Enter 4 digit passcode what you want again.";
                        _hiddenTextField.text = @"";
                        
                        [self setPasscodeLabel:0];
                        
                        [UIView animateWithDuration:0.3f animations:^{
                            
                            _backgroundView.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
                            
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                }
                
            }
            
        }
        
        /* passcode 확인 모드일 경우 */
        else    {
            
            /* Entered passcode is stored in NSUserDefaults for convenience */
            NSString *enteredPasscode = [[NSUserDefaults standardUserDefaults] objectForKey:@"passcode"];
            
            /* Match entered passcode to stored passcode */
            if ([passcode isEqualToString:enteredPasscode]) {
                
                [self dismissModalViewControllerAnimated:YES];
                
            }
            else    {
                
                _statusLabel.text = @"You entered wrong passcode. Please again.";
                _hiddenTextField.text = @"";
                
                [self setPasscodeLabel:0];
                
            }
            
        }
    
    return NO;
    
}
    
    return YES;
}

@end
