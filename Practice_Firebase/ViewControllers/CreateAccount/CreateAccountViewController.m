//
//  CreateAccountViewController.m
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import "CreateAccountViewController.h"

@implementation CreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Register";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.emailTextField = [[UITextField alloc] init];
    [self.view addSubview:self.emailTextField];
    self.emailTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.emailTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.emailTextField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = YES;
    [self.emailTextField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20].active = YES;
    [self.emailTextField.heightAnchor constraintEqualToConstant:40].active = YES;
    self.emailTextField.backgroundColor = [UIColor systemGrayColor];
    self.emailTextField.placeholder = @"Email Address";
    [self.emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    self.emailTextField.autocapitalizationType = NO;
    self.emailTextField.delegate = self;
    
    self.passwordTextField = [[UITextField alloc] init];
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.passwordTextField.topAnchor constraintEqualToAnchor:self.emailTextField.bottomAnchor constant:20].active = YES;
    [self.passwordTextField.centerXAnchor constraintEqualToAnchor:self.emailTextField.centerXAnchor].active = YES;
    [self.passwordTextField.widthAnchor constraintEqualToAnchor:self.emailTextField.widthAnchor].active = YES;
    [self.passwordTextField.heightAnchor constraintEqualToConstant:40].active = YES;
    self.passwordTextField.backgroundColor = [UIColor systemGrayColor];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.autocapitalizationType = NO;
    self.passwordTextField.delegate = self;
    
    self.submitButton = [[UIButton alloc] init];
    [self.view addSubview:self.submitButton];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton.centerXAnchor constraintEqualToAnchor:self.emailTextField.centerXAnchor].active = YES;
    [self.submitButton.topAnchor constraintEqualToAnchor:self.passwordTextField.bottomAnchor constant:20].active = YES;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    
    [self.submitButton addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)registerButton:(UIButton *)sender {
    [[FIRAuth auth] createUserWithEmail:self.emailTextField.text
                               password:self.passwordTextField.text
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
      // ...
        if (error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        } else {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Done" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
    }];
}

@end
