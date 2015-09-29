//
//  LoginView.m
//  ReactiveCocoaDemo
//
//  Created by 向海涛 on 15/9/29.
//  Copyright © 2015年 向海涛. All rights reserved.
//

#import "LoginView.h"
#import "TPKeyboardAvoidingScrollView.h"

NSString * const userNamePlaceholderString = @"请输入用户名";

NSString * const passwordPlaceholderString = @"请输入密码";

NSString * const submitButtonTitleForNormal = @"提交";

CGFloat const textFieldHeight = 50;

@implementation LoginView
{
    TPKeyboardAvoidingScrollView *scrollView;
}
@synthesize userNameTextField,passwordTextField,submitButton;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}

- (void)initSubviews {
    
    scrollView = [[TPKeyboardAvoidingScrollView alloc] init];
    scrollView.backgroundColor = [UIColor backGroundColor];
    [self addSubview:scrollView];
    
    userNameTextField = [[UITextField alloc] init];
    userNameTextField.placeholder = userNamePlaceholderString;
    userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self setLeftImageViewForTextField:userNameTextField imageName:@"ic_userlogin_normal.png"];
    [scrollView addSubview:userNameTextField];
    
    passwordTextField = [[UITextField alloc] init];
    passwordTextField.placeholder = passwordPlaceholderString;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self setLeftImageViewForTextField:passwordTextField imageName:@"ic_password_normal.png"];
    [scrollView addSubview:passwordTextField];
    
    submitButton = [[UIButton alloc] init];
    [submitButton setTitle:submitButtonTitleForNormal forState:UIControlStateNormal];
    [[submitButton layer] setCornerRadius:2.0];
    submitButton.backgroundColor = [UIColor buttonDisabledColor];
    [scrollView addSubview:submitButton];
    
}

- (void)setLayout {
    CGFloat marginX = 30;
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    CGFloat screenWidth = mainScreenBounds.size.width;
    CGFloat viewHeight = mainScreenBounds.size.height - 64;
    CGFloat textFieldWidth = screenWidth - marginX * 2;
    CGFloat submitButtonWidth = screenWidth - marginX * 2;
    CGFloat submitButtonHeight = 50;
    CGFloat offsetY = 50;
    
    scrollView.frame = CGRectMake(0, 0, screenWidth, viewHeight);
    
    userNameTextField.frame = CGRectMake(marginX, offsetY,textFieldWidth,textFieldHeight);
    
    offsetY = offsetY + textFieldHeight + 20;
    passwordTextField.frame = CGRectMake(marginX, offsetY, textFieldWidth, textFieldHeight);
    
    offsetY = offsetY + textFieldHeight + 70;
    submitButton.frame = CGRectMake(marginX, offsetY, submitButtonWidth, submitButtonHeight);
    
    scrollView.contentSize = CGSizeMake(screenWidth, offsetY +20);
    
}

- (void)setLeftImageViewForTextField:(UITextField *)textField imageName:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    CGFloat offsetY = (textFieldHeight - 25)/2;
    imageView.frame = CGRectMake(10, offsetY, 25, 25);
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textFieldHeight, textFieldHeight)];
    [textField.leftView addSubview:imageView];
    
}

@end
