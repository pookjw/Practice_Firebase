//
//  FSReadDataViewController.h
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <FirebaseFirestore/FIRFirestore.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSReadDataViewController : UIViewController
@property (nonatomic, readwrite) FIRFirestore *db;
@property UIButton *setDataButton;
@property UIButton *setDataButton2;
@property UIButton *readDataButton;
@property UIButton *readDataButton2;
@property UIButton *queryDataButton;
@end

NS_ASSUME_NONNULL_END
