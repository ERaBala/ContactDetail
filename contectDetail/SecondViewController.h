//
//  SecondViewController.h
//  contectDetail
//
//  Created by Nasrudeen on 22/03/16.
//  Copyright © 2016 Nasrudeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, retain) NSString *FName;
@property (nonatomic, retain) NSString *LName;
@property (nonatomic, retain) NSString *Age;
@property (nonatomic, retain) NSString *Address;
@property (nonatomic, retain) NSString *MNumber;
@property (nonatomic, retain) NSString *BloodGrp;
@property (nonatomic, retain) NSString *Sex;

@property (weak, nonatomic) IBOutlet UILabel *FNameLable;
@property (weak, nonatomic) IBOutlet UILabel *LNameLable;
@property (weak, nonatomic) IBOutlet UILabel *AgeLable;
@property (weak, nonatomic) IBOutlet UILabel *AddressLable;
@property (weak, nonatomic) IBOutlet UILabel *MobileNumberLable;
@property (weak, nonatomic) IBOutlet UILabel *BloodGroupLable;



@end
