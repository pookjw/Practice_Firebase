//
//  FSAddDataViewController.h
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <FirebaseFirestore/FIRFirestore.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSAddDataViewController : UIViewController <UITextFieldDelegate>
@property UITextField *locationTextField;
@property UITextField *weatherConditionTextField;
@property UITextField *weatherCelsiusField;
@property UIButton *submitButton;
@property UIButton *getButton1;
@property UIButton *getButton2;
@property (nonatomic, readwrite) FIRFirestore *db;
@end

NS_ASSUME_NONNULL_END
