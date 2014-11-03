//
//  Details.m
//  SalesforceCCE
//
//  Created by Rene Candelier on 11/2/14.
//  Copyright (c) 2014 CCE. All rights reserved.
//

#import "Details.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface Details ()

@end

@implementation Details{
    
    UIButton * updateButton;
    
    UITextField * bottlerNameTextField;
    
    UITextView * bottlerAddressTextField;
    
    UITextField * bottlerTelephoneTextField;
    
    
    UILabel * statusofUpdate;
    
    NSString * IDforBottler;
    
}

-(id)initWithName:(NSString *)countryName bottler:(NSString *)bottlerName address:(NSString *)bottlerAddress telephone:(NSString *)bottlerTelephone ID:(NSString *)bottlerID{
    self = [super init];
    
    if (self) {
        
        
        
        
        self.title = countryName;
        
        IDforBottler = bottlerID;
        
        self.view.backgroundColor = [UIColor whiteColor];

        
        if ([bottlerName isEqualToString:nil]) {
            bottlerName = @"";
            bottlerNameTextField.text =bottlerName;

        }else{
            //Text Field for Bottler Name
            
            bottlerNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT-400, 300, 35)];
            [self.view addSubview:bottlerNameTextField];
            
            bottlerNameTextField.textAlignment  = UITextAlignmentCenter;
            [bottlerNameTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];

            bottlerNameTextField.textColor = [UIColor darkGrayColor];
            bottlerNameTextField.text =bottlerName;

        }
        
        
        
        if ([bottlerAddress isEqualToString:nil]) {
            bottlerAddress = @"";
            bottlerAddressTextField.text =bottlerAddress;

        }else{
            //Text Field for Bottler Address
            
            bottlerAddressTextField = [[UITextView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT-330, 300, 160)];
            [self.view addSubview:bottlerAddressTextField];
            
            bottlerAddressTextField.textAlignment  = UITextAlignmentCenter;
            
            [bottlerAddressTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];

            bottlerAddressTextField.textColor = [UIColor darkGrayColor];

            bottlerAddressTextField.text =bottlerAddress;

        }
        
        
        if ([bottlerTelephone isEqualToString:nil]) {
            
            bottlerTelephone = @"";
            bottlerTelephoneTextField.text =bottlerTelephone;

        }else{
            
            //Text Field for Bottler Telephone
            
            bottlerTelephoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT-160, 300, 35)];
            [self.view addSubview:bottlerTelephoneTextField];
            
            bottlerTelephoneTextField.textAlignment  = UITextAlignmentCenter;

            
            [bottlerTelephoneTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];

            
            bottlerTelephoneTextField.text =bottlerTelephone;
            bottlerTelephoneTextField.textColor = [UIColor darkGrayColor];

            
        }
        
        


        
        updateButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-75, SCREEN_HEIGHT-100, 150, 50)];
        
        [self.view addSubview:updateButton];
        
        updateButton.backgroundColor = [UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];
        
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton addTarget:self action:@selector(updateButton) forControlEvents:UIControlEventTouchUpInside];
        [updateButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];

        updateButton.layer.cornerRadius = 10; // this value vary as per your desire
        updateButton.clipsToBounds = YES;
        
    }
    return self;
}

- (void) updateButton{

    statusofUpdate = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 100, 80)];
    
    [self.view addSubview:statusofUpdate];
    
    NSDictionary * fields = [NSDictionary dictionaryWithObjectsAndKeys:bottlerNameTextField.text,@"Bottler_Name__c",
                             bottlerAddressTextField.text,@"Address__c",
                             bottlerTelephoneTextField.text,@"Telephone__c",nil];
    
    SFRestRequest * request = [[SFRestAPI sharedInstance] requestForUpdateWithObjectType:@"Location__c" objectId:IDforBottler fields:fields];
    
    [[SFRestAPI sharedInstance] send:request delegate:self];
    
}

- (void) request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse{
 
    NSLog(@"1 Record Updated");
    
    statusofUpdate.text = @"1 Record Updated";
    
    statusofUpdate.textColor = [UIColor redColor];
    
   // [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated { [self.navigationController setNavigationBarHidden:NO animated:animated]; [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];

    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];
    //[[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    

}


@end
