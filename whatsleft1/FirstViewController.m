//
//  FirstViewController.m
//  whatsleft1
//
//  Created by apple on 12/10/15.
//  Copyright © 2015 appsec. All rights reserved.
//

#import "FirstViewController.h"
#import <Parse/Parse.h>

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *profilenamelabel;
@property (strong, nonatomic) IBOutlet UIImageView *profilepicture;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UILabel *emaillbl;

//@property (strong, nonatomic) NSString *textreceiver;
@property (weak, nonatomic) IBOutlet UILabel *campuslbl;

@property (weak, nonatomic) IBOutlet UILabel *programlabel;



@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
    //PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //testObject[@"foo"] = @"bar";
    //[testObject saveInBackground];
  
   //give a circle shape to the image
    UIImage *image = [UIImage imageNamed:@"yourRoundImage.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.layer.cornerRadius = image.size.width / 2;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview: imageView];
   
//    NSLog(@"%@", _textreceiver);
    
//   self.profilenamelabel.text = _textreceiver;
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSString *cUser = [NSString stringWithFormat:@"%@", currentUser.username];
//        NSLog(@"%@",currentUser.username);
    self.profilenamelabel.text = cUser;
        
    } else {
        // show the signup or login screen
    }
    
    [self performSelector:@selector(retrieve)];
    
    
    
        }



-(void)retrieve{
    
    PFUser *currentUser = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"studentPlusPlus"];
    [query whereKey:@"sID" equalTo:currentUser.username];
    [query getFirstObjectInBackgroundWithBlock: ^(PFObject *userDataObject, NSError *error){
        if (!error){
            data = [[NSArray alloc]initWithObjects:userDataObject, nil];
            NSString *nameText = userDataObject[@"cName"];
            self.namelbl.text = nameText;
            NSString *email = userDataObject[@"cID"];
            self.emaillbl.text = email;
            NSString *program = userDataObject[@"sDisplince"];
            self.programlabel.text = program;
            NSString *major = userDataObject[@"sMajor"];
            self.campuslbl.text = major;
            
            NSLog(@"%@", data);
            
            
        }
        
    }];
  

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
