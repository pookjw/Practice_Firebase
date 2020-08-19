//
//  FSDeleteDataViewController.h
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <FirebaseFirestore/FIRFirestore.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSDeleteDataViewController : UIViewController
@property UIButton *addDataButton;
@property UIButton *deleteDataButton;
@property UIButton *deleteCollectionButton;
@property UIButton *deleteFieldButton;
@property (nonatomic, readwrite) FIRFirestore *db;
@end

NS_ASSUME_NONNULL_END
