//
//  ViewController.m
//  contectDetail
//
//  Created by Nasrudeen on 22/03/16.
//  Copyright © 2016 Nasrudeen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ViewContects:(id)sender {

    _addressBookController = [[ABPeoplePickerNavigationController alloc] init];
    [_addressBookController setPeoplePickerDelegate:self];
    [self presentViewController:_addressBookController animated:YES completion:nil];
    
}

- (ABRecordRef)buildContactDetails {
    NSLog(@"building contact details");
    ABRecordRef person = ABPersonCreate();
    CFErrorRef  error = NULL;
    
    NSString * phoneNumber = self.phoneNoField.text;
    NSString * Name = self.nameField.text;
    NSString * addressString1 = self.Address1.text;
    NSString * addressString2 = self.Address2.text;
    
    // firstname
    ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFTypeRef)(Name), NULL);
    
    // email
    ABMutableMultiValueRef email = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(email, @"Bala@kaizentechnosoft.com", CFSTR("email"), NULL);
    ABRecordSetValue(person, kABPersonEmailProperty, email, &error);
    CFRelease(email);
    
    // Start of Address
    ABMutableMultiValueRef address = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
    NSMutableDictionary *addressDict = [[NSMutableDictionary alloc] init];
    [addressDict setObject:addressString1 forKey:(NSString *)kABPersonAddressStreetKey];
    [addressDict setObject:addressString2 forKey:(NSString *)kABPersonAddressZIPKey];
    [addressDict setObject:@"India" forKey:(NSString *)kABPersonAddressCityKey];
    ABMultiValueAddValueAndLabel(address, (__bridge CFTypeRef)(addressDict), kABWorkLabel, NULL);
    ABRecordSetValue(person, kABPersonAddressProperty, address, &error);
    CFRelease(address);
    // End of Address
    
    ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    
    bool didAddPhone = ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(phoneNumber), kABPersonPhoneMobileLabel, NULL);
    
    if(didAddPhone){
        
        ABRecordSetValue(person, kABPersonPhoneProperty, multiPhone,nil);
        NSLog(@"Phone Number saved......");
        [self clearString];
    }

    if (error != NULL)
        NSLog(@"Error: %@", error);
    
    return person;
}

- (IBAction)Save:(id)sender {
    if ([self.nameField.text length] != 0 && [self.phoneNoField.text length] == 10) {
        ABUnknownPersonViewController *unknownPersonViewController = [[ABUnknownPersonViewController alloc] init];
        unknownPersonViewController.displayedPerson = (ABRecordRef)[self buildContactDetails];
        unknownPersonViewController.allowsAddingToAddressBook = YES;
        [self.navigationController pushViewController:unknownPersonViewController animated:YES];
    }
    else{ UIAlertController * alert=   [UIAlertController
                                        alertControllerWithTitle:@"Info"
                                        message:@"Name / Phone no Block is Emty"
                                        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {
                                            [alert dismissViewControllerAnimated:YES completion:nil];
                                        }];
        [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    }
  
  }



-(void)clearString{
    self.nameField.text=@"";
    self.phoneNoField.text=@"";
    self.Address1.text=@"";
    self.Address2.text=@"";
}
@end
