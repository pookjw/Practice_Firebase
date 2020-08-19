//
//  MainViewController.m
//  Practice_Firebase
//
//  Created by pook on 8/19/20.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.title = @"Firebase";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (UITableView *)tableView {
    return _tableView;
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Create Account";
            break;
        case 1:
            cell.textLabel.text = @"Sign in";
            break;
        case 2:
            cell.textLabel.text = @"Add Data";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
            vc = [[CreateAccountViewController alloc] init];
            break;
        case 1:
            vc = [[SignInViewController alloc] init];
            break;
        case 2:
            vc = [[FSAddDataViewController alloc] init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    [[self.tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
