//
//  loginViewController.m
//  whatsleft1
//
//  Created by apple on 12/10/15.
//  Copyright © 2015 appsec. All rights reserved.
//

#import "loginViewController.h"
#import <Parse/Parse.h>
#import "FirstViewController.h"
@interface loginViewController ()
// User Name
@property (weak, nonatomic) IBOutlet UITextField *loginIDLabel;
//User ID
@property (weak, nonatomic) IBOutlet UITextField *loginID;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//    NSString * input = _loginIDLabel.text;
//    
//    
//    FirstViewController *destination =[segue destinationViewController];
//    
//    
//    destination.textreceiver = [NSString stringWithFormat:@"%@",input];
//    
//}



- (IBAction)loginClick:(id)sender
{
    
    
    [PFUser logInWithUsernameInBackground:self.loginIDLabel.text password:self.loginID.text
        block:^(PFUser *user, NSError *error) {
                    if (user) {
                                // Do stuff after successful login.
                        [self performSegueWithIdentifier:@"loginView" sender:nil];
                        
                                        }
                    else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
    

    }

@end
