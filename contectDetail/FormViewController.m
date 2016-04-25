//
//  FormViewController.m
//  contectDetail
//
//  Created by Nasrudeen on 22/03/16.
//  Copyright © 2016 Nasrudeen. All rights reserved.
//

#import "FormViewController.h"
#import "SecondViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)PassingData:(id)sender {
    
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.FName = self.FirstName.text; vc.LName=self.LastName.text;
    vc.Address=self.Address.text;
    vc.Age=self.Age.text;
    vc.MNumber=self.MobNumber.text;
    vc.BloodGrp=self.BloodGroup.text;
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
