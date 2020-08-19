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
    
    [self.submitButton addTarget:self action:@selector(submitButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.getButton1 = [[UIButton alloc] init];
    [self.view addSubview:self.getButton1];
    self.getButton1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.getButton1.centerXAnchor constraintEqualToAnchor:self.submitButton.centerXAnchor].active = YES;
    [self.getButton1.topAnchor constraintEqualToAnchor:self.submitButton.bottomAnchor constant:20].active = YES;
    [self.getButton1 setTitle:@"Get (transaction)" forState:UIControlStateNormal];
    [self.getButton1 setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.getButton1 setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.getButton1 addTarget:self action:@selector(getButton1:) forControlEvents:UIControlEventTouchUpInside];
    
    self.getButton2 = [[UIButton alloc] init];
    [self.view addSubview:self.getButton2];
    self.getButton2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.getButton2.centerXAnchor constraintEqualToAnchor:self.getButton1.centerXAnchor].active = YES;
    [self.getButton2.topAnchor constraintEqualToAnchor:self.getButton1.bottomAnchor constant:20].active = YES;
    [self.getButton2 setTitle:@"Get (batch)" forState:UIControlStateNormal];
    [self.getButton2 setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.getButton2 setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.getButton2 addTarget:self action:@selector(getButton2:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)getButton1:(UIButton *)sender {
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

- (void)getButton2:(UIButton *)sender {
    FIRWriteBatch *batch = [self.db batch];
    
    
    // Set Data
    FIRDocumentReference *japanRef = [[self.db collectionWithPath:@"weather"] documentWithPath:@"Japan"];
    [batch setData:@{@"location":@"Nagoya", @"condition":@"Good", @"celcius":@30} forDocument:japanRef];
    
    // Update Data
    FIRDocumentReference *koreaRef = [[self.db collectionWithPath:@"weather"] documentWithPath:@"Korea"];
    [batch updateData:@{@"location": @"Busan"} forDocument:koreaRef];
    
    // Delete Data
    [batch deleteDocument:koreaRef];
    
    // Commit the batch
    [batch commitWithCompletion:^(NSError * _Nullable error) {
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
