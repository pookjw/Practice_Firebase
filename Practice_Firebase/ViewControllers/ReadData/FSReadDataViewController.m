//
//  FSReadDataViewController.m
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import "FSReadDataViewController.h"

@interface FSReadDataViewController ()

@end

@implementation FSReadDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];
    
    self.title = @"Read Data";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.setDataButton = [[UIButton alloc] init];
    [self.view addSubview:self.setDataButton];
    self.setDataButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.setDataButton.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20].active = YES;
    [self.setDataButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.setDataButton setTitle:@"Set Test Data" forState:UIControlStateNormal];
    [self.setDataButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.setDataButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.setDataButton addTarget:self action:@selector(setButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.setDataButton2 = [[UIButton alloc] init];
    [self.view addSubview:self.setDataButton2];
    self.setDataButton2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.setDataButton2.centerXAnchor constraintEqualToAnchor:self.setDataButton.centerXAnchor].active = YES;
    [self.setDataButton2.topAnchor constraintEqualToAnchor:self.setDataButton.bottomAnchor constant:20].active = YES;
    [self.setDataButton2 setTitle:@"Set Test Data (with batch)" forState:UIControlStateNormal];
    [self.setDataButton2 setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.setDataButton2 setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.setDataButton2 addTarget:self action:@selector(setButton2:) forControlEvents:UIControlEventTouchUpInside];
    
    self.readDataButton = [[UIButton alloc] init];
    [self.view addSubview:self.readDataButton];
    self.readDataButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.readDataButton.centerXAnchor constraintEqualToAnchor:self.setDataButton2.centerXAnchor].active = YES;
    [self.readDataButton.topAnchor constraintEqualToAnchor:self.setDataButton2.bottomAnchor constant:20].active = YES;
    [self.readDataButton setTitle:@"Read Data" forState:UIControlStateNormal];
    [self.readDataButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.readDataButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.readDataButton addTarget:self action:@selector(readButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.readDataButton2 = [[UIButton alloc] init];
    [self.view addSubview:self.readDataButton2];
    self.readDataButton2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.readDataButton2.centerXAnchor constraintEqualToAnchor:self.readDataButton.centerXAnchor].active = YES;
    [self.readDataButton2.topAnchor constraintEqualToAnchor:self.readDataButton.bottomAnchor constant:20].active = YES;
    [self.readDataButton2 setTitle:@"Read Data using Source (Cache)" forState:UIControlStateNormal];
    [self.readDataButton2 setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.readDataButton2 setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.readDataButton2 addTarget:self action:@selector(readButton2:) forControlEvents:UIControlEventTouchUpInside];
    
    self.queryDataButton = [[UIButton alloc] init];
    [self.view addSubview:self.queryDataButton];
    self.queryDataButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.queryDataButton.centerXAnchor constraintEqualToAnchor:self.readDataButton2.centerXAnchor].active = YES;
    [self.queryDataButton.topAnchor constraintEqualToAnchor:self.readDataButton2.bottomAnchor constant:20].active = YES;
    [self.queryDataButton setTitle:@"Read Data (Query)" forState:UIControlStateNormal];
    [self.queryDataButton setTitleColor:[UIColor systemRedColor] forState:UIControlStateNormal];
    [self.queryDataButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateHighlighted];
    [self.queryDataButton addTarget:self action:@selector(queryButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButton:(UIButton *)sender {
    FIRCollectionReference *citiesRef = [self.db collectionWithPath:@"cities"];
    
    [[citiesRef documentWithPath:@"SF"] setData:@{
        @"name": @"San Francisco",
        @"state": @"CA",
        @"country": @"USA",
        @"capital": @(NO),
        @"population": @860000,
        @"regions": @[@"west_coast", @"norcal"]
    }];
    [[citiesRef documentWithPath:@"LA"] setData:@{
        @"name": @"Los Angeles",
        @"state": @"CA",
        @"country": @"USA",
        @"capital": @(NO),
        @"population": @3900000,
        @"regions": @[@"west_coast", @"socal"]
    }];
    [[citiesRef documentWithPath:@"DC"] setData:@{
        @"name": @"Washington D.C.",
        @"country": @"USA",
        @"capital": @(YES),
        @"population": @680000,
        @"regions": @[@"east_coast"]
    }];
    [[citiesRef documentWithPath:@"TOK"] setData:@{
        @"name": @"Tokyo",
        @"country": @"Japan",
        @"capital": @(YES),
        @"population": @9000000,
        @"regions": @[@"kanto", @"honshu"]
    }];
    [[citiesRef documentWithPath:@"BJ"] setData:@{
        @"name": @"Beijing",
        @"country": @"China",
        @"capital": @(YES),
        @"population": @21500000,
        @"regions": @[@"jingjinji", @"hebei"]
    }];
}

- (void)setButton2:(UIButton *)sender {
    FIRWriteBatch *batch = [self.db batch];
    FIRCollectionReference *citiesRef = [self.db collectionWithPath:@"cities"];
    
    FIRDocumentReference *sfRef = [citiesRef documentWithPath:@"SF"];
    [batch setData:@{
        @"name": @"San Francisco",
        @"state": @"CA",
        @"country": @"USA",
        @"capital": @(NO),
        @"population": @860000,
        @"regions": @[@"west_coast", @"norcal"]
    } forDocument:sfRef];
    
    FIRDocumentReference *laRef = [citiesRef documentWithPath:@"LA"];
    [batch setData:@{
        @"name": @"Los Angeles",
        @"state": @"CA",
        @"country": @"USA",
        @"capital": @(NO),
        @"population": @3900000,
        @"regions": @[@"west_coast", @"socal"]
    } forDocument:laRef];
    
    FIRDocumentReference *dcRef = [citiesRef documentWithPath:@"DC"];
    [batch setData:@{
        @"name": @"Washington D.C.",
        @"country": @"USA",
        @"capital": @(YES),
        @"population": @680000,
        @"regions": @[@"east_coast"]
    } forDocument:dcRef];
    
    FIRDocumentReference *tokRef = [citiesRef documentWithPath:@"TOK"];
    [batch setData:@{
        @"name": @"Tokyo",
        @"country": @"Japan",
        @"capital": @(YES),
        @"population": @9000000,
        @"regions": @[@"kanto", @"honshu"]
    } forDocument:tokRef];
    
    FIRDocumentReference *bjRef = [citiesRef documentWithPath:@"BJ"];
    [batch setData:@{
        @"name": @"Beijing",
        @"country": @"China",
        @"capital": @(YES),
        @"population": @21500000,
        @"regions": @[@"jingjinji", @"hebei"]
    } forDocument:bjRef];
    
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

- (void)readButton:(UIButton *)sender {
    FIRDocumentReference *docRef = [[self.db collectionWithPath:@"cities"] documentWithPath:@"SF"];
    [docRef getDocumentWithCompletion:^(FIRDocumentSnapshot *snapshot, NSError * _Nullable error) {
        if (error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        } else {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Done" message:[NSString stringWithFormat:@"%@", snapshot.data] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
            
            // snashot.data, snapshot.exists
        }
    }];
}

- (void)readButton2:(UIButton *)sender {
    FIRDocumentReference *docRef = [[self.db collectionWithPath:@"cities"] documentWithPath:@"SF"];
    
    [docRef getDocumentWithSource:FIRFirestoreSourceCache
                       completion:^(FIRDocumentSnapshot *snapshot, NSError * _Nullable error) {
        if (error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        } else {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Done" message:[NSString stringWithFormat:@"%@", snapshot.data] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
            
            // snashot.data, snapshot.exists
        }
    }];
}

- (void)queryButton:(UIButton *)sender {
    FIRQuery *query = [[self.db collectionWithPath:@"cities"] queryWhereField:@"capital" isEqualTo:@YES];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        if (error != nil) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSLog(@"%@ => %@", document.documentID, document.data);
            }
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Done" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
    }];
}
@end
