//
//  MainViewController.h
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import <UIKit/UIKit.h>
#import "CreateAccountViewController.h"
#import "SignInViewController.h"
#import "FSAddDataViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
}
- (UITableView *)tableView;
- (void)setTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
