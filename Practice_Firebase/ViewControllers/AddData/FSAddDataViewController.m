//
//  FSAddDataViewController.m
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import "FSAddDataViewController.h"

@implementation FSAddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];
    
    self.title = @"Add Data";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.locationTextField = [[UITextField alloc] init];
    [self.view addSubview:self.locationTextField];
    self.locationTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.locationTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.locationTextField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = YES;
    [self.locationTextField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20].active = YES;
    [self.locationTextField.heightAnchor constraintEqualToConstant:40].active = YES;
    self.locationTextField.backgroundColor = [UIColor systemGrayColor];
    self.locationTextField.placeholder = @"Location";
    self.locationTextField.delegate = self;
    
    self.weatherConditionTextField = [[UITextField alloc] init];
    [self.view addSubview:self.weatherConditionTextField];
    self.weatherConditionTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.weatherConditionTextField.topAnchor constraintEqualToAnchor:self.locationTextField.bottomAnchor constant:20].active = YES;
    [self.weatherConditionTextField.centerXAnchor constraintEqualToAnchor:self.locationTextField.centerXAnchor].active = YES;
    [self.weatherConditionTextField.widthAnchor constraintEqualToAnchor:self.locationTextField.widthAnchor].active = YES;
    [self.weatherConditionTextField.heightAnchor constraintEqualToConstant:40].active = YES;
    self.weatherConditionTextField.backgroundColor = [UIColor systemGrayColor];
    self.weatherConditionTextField.placeholder = @"Condition";
    self.weatherConditionTextField.autocapitalizationType = NO;
    self.weatherConditionTextField.delegate = self;
    
    self.weatherCelsiusField = [[UITextField alloc] init];
    [self.view addSubview:self.weatherCelsiusField];
    self.weatherCelsiusField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.weatherCelsiusField.topAnchor constraintEqualToAnchor:self.weatherConditionTextField.bottomAnchor constant:20].active = YES;
    [self.weatherCelsiusField.centerXAnchor constraintEqualToAnchor:self.weatherConditionTextField.centerXAnchor].active = YES;
    [self.weatherCelsiusField.widthAnchor constraintEqualToAnchor:self.weatherConditionTextField.widthAnchor].active = YES;
    [self.weatherCelsiusField.heightAnchor constraintEqualToConstant:40].active = YES;
    self.weatherCelsiusField.backgroundColor = [UIColor systemGrayColor];
    self.weatherCelsiusField.placeholder = @"Celsius";
    self.weatherCelsiusField.autocapitalizationType = NO;
    self.weatherCelsiusField.delegate = self;
    
    self.submitButton = [[UIButton alloc] init];
    [self.view addSubview:self.submitButton];
    self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.submitButton.centerXAnchor constraintEqualToAnchor:self.weatherCelsiusField.centerXAnchor].active = YES;
    [self.submitButton.topAnchor constraintEqualToAnchor:self.weatherCelsiusField.bottomAnchor constant:20].active = YES;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    
    [self.submitButton addTarget:self action:@selector(submitButton:) forControlEvents:UIControlEventTouchDown];
    
    self.getButton = [[UIButton alloc] init];
    [self.view addSubview:self.getButton];
    self.getButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.getButton.centerXAnchor constraintEqualToAnchor:self.submitButton.centerXAnchor].active = YES;
    [self.getButton.topAnchor constraintEqualToAnchor:self.submitButton.bottomAnchor constant:20].active = YES;
    [self.getButton setTitle:@"Get" forState:UIControlStateNormal];
    [self.getButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.getButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    
    [self.getButton addTarget:self action:@selector(getButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)submitButton:(UIButton *)sender {
    NSDictionary *data = @{
        @"location": self.locationTextField.text,
        @"condition": self.weatherConditionTextField.text,
        @"celsius": [NSNumber numberWithInt:[self.weatherCelsiusField.text intValue]]
    };
    
    [[[self.db collectionWithPath:@"weather"] documentWithPath:@"Korea"] setData:data completion:^(NSError * _Nullable error) {
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

- (void)getButton:(UIButton *)sender {
    FIRDocumentReference *sfReference = [[self.db collectionWithPath:@"weather"] documentWithPath:@"Korea"];
    [self.db runTransactionWithBlock:^id (FIRTransaction *transaction, NSError **errorPointer) {
        FIRDocumentSnapshot *sfDocument = [transaction getDocument:sfReference error:errorPointer];
        
        if (*errorPointer != nil) { return nil; }
        if (![sfDocument.data[@"location"] isKindOfClass:[NSString class]]) {
            *errorPointer = [NSError errorWithDomain:@"AppErrorDomain" code:-1 userInfo:@{
                NSLocalizedDescriptionKey: @"Unable to retreive location from snapshot"
            }];
            return nil;
        }
        
        NSString *location = sfDocument.data[@"location"];
        NSLog(@"Notification: %@", location);
        [transaction updateData:@{ @"location": @"Blue House" } forDocument:sfReference];
        
        return nil;
    }
                          completion:^(id result, NSError *error) {
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
