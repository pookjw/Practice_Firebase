//
//  FSDeleteDataViewController.m
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import "FSDeleteDataViewController.h"

@interface FSDeleteDataViewController ()

@end

@implementation FSDeleteDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];
    
    self.title = @"Delete Data";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.addDataButton = [[UIButton alloc] init];
    [self.view addSubview:self.addDataButton];
    self.addDataButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addDataButton.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.addDataButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.addDataButton setTitle:@"Add Test Data" forState:UIControlStateNormal];
    [self.addDataButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.addDataButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.addDataButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.deleteDataButton = [[UIButton alloc] init];
    [self.view addSubview:self.deleteDataButton];
    self.deleteDataButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.deleteDataButton.centerXAnchor constraintEqualToAnchor:self.addDataButton.centerXAnchor].active = YES;
    [self.deleteDataButton.topAnchor constraintEqualToAnchor:self.addDataButton.bottomAnchor constant:20].active = YES;
    [self.deleteDataButton setTitle:@"Delete Test Data" forState:UIControlStateNormal];
    [self.deleteDataButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.deleteDataButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.deleteDataButton addTarget:self action:@selector(deleteButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.deleteCollectionButton = [[UIButton alloc] init];
    [self.view addSubview:self.deleteCollectionButton];
    self.deleteCollectionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.deleteCollectionButton.centerXAnchor constraintEqualToAnchor:self.deleteDataButton.centerXAnchor].active = YES;
    [self.deleteCollectionButton.topAnchor constraintEqualToAnchor:self.deleteDataButton.bottomAnchor constant:20].active = YES;
    [self.deleteCollectionButton setTitle:@"Delete Weather Collection" forState:UIControlStateNormal];
    [self.deleteCollectionButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.deleteCollectionButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.deleteCollectionButton addTarget:self action:@selector(deleteButton2:) forControlEvents:UIControlEventTouchUpInside];
    
    self.deleteFieldButton = [[UIButton alloc] init];
    [self.view addSubview:self.deleteFieldButton];
    self.deleteFieldButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.deleteFieldButton.centerXAnchor constraintEqualToAnchor:self.deleteCollectionButton.centerXAnchor].active = YES;
    [self.deleteFieldButton.topAnchor constraintEqualToAnchor:self.deleteCollectionButton.bottomAnchor constant:20].active = YES;
    [self.deleteFieldButton setTitle:@"Delete Field" forState:UIControlStateNormal];
    [self.deleteFieldButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.deleteFieldButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.deleteFieldButton addTarget:self action:@selector(deleteButton3:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addButton:(UIButton *)sender {
    FIRDocumentReference *rf = [[self.db collectionWithPath:@"weather"] documentWithPath:@"United States"];
    [self.db runTransactionWithBlock:^id (FIRTransaction *transaction, NSError **errorPointer) {
        if (*errorPointer != nil) { return nil; }
        [transaction setData:@{@"location":@"Irvine", @"celsius":@32} forDocument:rf];
        
        return nil;
    } completion:^(id result, NSError *error) {
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

- (void)deleteButton:(UIButton *)sender {
    FIRDocumentReference *rf = [[self.db collectionWithPath:@"weather"] documentWithPath:@"United States"];
    [rf deleteDocumentWithCompletion:^(NSError *error) {
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

- (void)deleteButton2:(UIButton *)sender {
//    FIRCollectionReference *rf = [self.db collectionWithPath:@"weather"];
//    [rf deleteDocumentWithCompletion:^(NSError *error) {
//        if (error != nil) {
//            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//            [alertVC addAction:okAction];
//            [self presentViewController:alertVC animated:YES completion:nil];
//        } else {
//            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Done" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//            [alertVC addAction:okAction];
//            [self presentViewController:alertVC animated:YES completion:nil];
//        }
//    }];
}

- (void)deleteButton3:(UIButton *)sender {
    FIRDocumentReference *rf = [[self.db collectionWithPath:@"weather"] documentWithPath:@"United States"];
    [rf updateData:@{@"location":[FIRFieldValue fieldValueForDelete]}
        completion:^(NSError *error) {
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
