//
//  CreateAccountViewController.h
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateAccountViewController : UIViewController <UITextFieldDelegate>
@property UITextField *emailTextField;
@property UITextField *passwordTextField;
@property UIButton *submitButton;
@end

NS_ASSUME_NONNULL_END
