//
//  LoginViewController.m
//  ReactiveCocoaDemo
//
//  Created by 向海涛 on 15/9/29.
//  Copyright © 2015年 向海涛. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()
{
    LoginView *loginView;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [self addLoginView];
    [self addSignals];
    [super viewDidLoad];
}

- (void)addLoginView {
    CGRect mainScreemBrounds = [UIScreen mainScreen].bounds;
    CGFloat viewWidth = mainScreemBrounds.size.width;
    CGFloat viewHeigt = mainScreemBrounds.size.height - 64;
    loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeigt)];
    [self.view addSubview:loginView];
}

- (void)addSignals {
    RACSignal *validUserNameSignal = [loginView.userNameTextField.rac_textSignal map:^id(NSString *value) {
        return @([self isValidUserName:value]);
    }];
    RAC(loginView.userNameTextField,backgroundColor) = [validUserNameSignal map:^(NSNumber *usernameValid) {
        return [usernameValid boolValue]?[UIColor yellowColor]:[UIColor clearColor];
    }];
    
    
    RACSignal *validPasswordSignal = [loginView.passwordTextField.rac_textSignal map:^id(NSString *value) {
        return @([self isValidPassword:value]);
    }];
    RAC(loginView.passwordTextField,backgroundColor) = [validPasswordSignal map:^(NSNumber *usernameValid) {
        return [usernameValid boolValue]?[UIColor yellowColor]:[UIColor clearColor];
    }];
    
    RACSignal *signUpActiveSignal = [RACSignal combineLatest:@[validUserNameSignal,validPasswordSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }];
    [signUpActiveSignal subscribeNext:^(NSNumber *signUpActive) {
        loginView.submitButton.enabled = [signUpActive boolValue];
        loginView.submitButton.backgroundColor = [signUpActive boolValue]?[UIColor buttonNormalColor]:[UIColor buttonDisabledColor];
    } completed:^{
        NSLog(@"signUpActiveSignal is completed");
    }];
    
    [[loginView.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"submitButton is enabled and clicked");
    } completed:^{
        NSLog(@"submitButtonClickedSignal is completed");
    }];
}

- (BOOL)isValidUserName:(NSString *)userName {
    
    return userName.length > 4;
}

- (BOOL)isValidPassword:(NSString *)userName {
    
    return userName.length > 4;
}

@end
