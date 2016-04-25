//
//  FormViewController.h
//  contectDetail
//
//  Created by Nasrudeen on 22/03/16.
//  Copyright © 2016 Nasrudeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *FirstName;
@property (weak, nonatomic) IBOutlet UITextField *LastName;
@property (weak, nonatomic) IBOutlet UITextField *Age;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UITextField *MobNumber;
@property (weak, nonatomic) IBOutlet UITextField *BloodGroup;
- (IBAction)PassingData:(id)sender;

@end
