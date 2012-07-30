//
//  PasscodeViewController.h
//  PasscodeDemo
//
//  Created by YoonBong Kim on 12. 7. 30..
//  Copyright (c) 2012년 YoonBong Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasscodeViewController : UIViewController   <UITextFieldDelegate>  {
    
    UIView *_backgroundView;
    UILabel *_explanationLabel;
    UILabel *_statusLabel;
    UITextField *_hiddenTextField;
    
    BOOL _isEnterMode;
    NSMutableString *_enteredPasscode;
}

@property (nonatomic, assign) BOOL isEnterMode;

@end
