//
//  signViewController.m
//  whatsleft1
//
//  Created by apple on 12/10/15.
//  Copyright © 2015 appsec. All rights reserved.
//

#import "signViewController.h"
#import <Parse/Parse.h>
@interface signViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentFirstName;
@property (weak, nonatomic) IBOutlet UITextField *studentLastName;
@property (weak, nonatomic) IBOutlet UITextField *studentMD;

@end

@implementation signViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpLabel:(id)sender
{
    PFUser *user = [PFUser user];
    
    user.username = _studentFirstName.text;
    user.password =_studentMD.text;
    
    
    // other fields can be set just like with PFObject
  
    
    

    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {
            NSLog(@"success");
            // Hooray! Let them use the app now.
        } else
        {
           ;   // Show the errorString somewhere and let the user try again.
            NSLog(@"error");
        }
    }];
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
