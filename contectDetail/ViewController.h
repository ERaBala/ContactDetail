//
//  ViewController.h
//  contectDetail
//
//  Created by Nasrudeen on 22/03/16.
//  Copyright © 2016 Nasrudeen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate>
{
    ABNewPersonViewController *newPersonController;
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNoField;
@property (weak, nonatomic) IBOutlet UITextField *Address1;
@property (weak, nonatomic) IBOutlet UITextField *Address2;

- (IBAction)ViewContects:(id)sender;
- (IBAction)Save:(id)sender;

@end

