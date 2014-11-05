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

@interface Details ()<UITextFieldDelegate, UITextViewDelegate,UIScrollViewDelegate>

@end

@implementation Details{
    
    UIButton * updateButton;
    
    UITextField * bottlerNameTextField;
    
    UITextView * bottlerAddressTextField;
    
    UITextField * bottlerTelephoneTextField;
    
    
    UILabel * statusofUpdate;
    
    NSString * IDforBottler;
    
    UIView * subView;
    
    UIScrollView * theScrollView;
    
}

-(id)initWithName:(NSString *)countryName bottler:(NSString *)bottlerName address:(NSString *)bottlerAddress telephone:(NSString *)bottlerTelephone ID:(NSString *)bottlerID{
    self = [super init];
    
    if (self) {
        
        theScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        
        UILabel * bottler = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 50, 300, 35)];
        [theScrollView  addSubview:bottler];
        
        [bottler  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:28]];
        bottler.textColor = [UIColor darkGrayColor];
        [bottler setTextAlignment:UITextAlignmentCenter]; //to center text in the UILabel

        bottler.text = @"Bottler";
        
        
        
        UILabel * bottleraddress = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 120, 300, 35)];
        [theScrollView  addSubview:bottleraddress];
        
        [bottleraddress  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:28]];
        bottleraddress.textColor = [UIColor darkGrayColor];
        [bottleraddress setTextAlignment:UITextAlignmentCenter]; //to center text in the UILabel
        
        bottleraddress.text = @"Address";
        
        
        UILabel * bottlerTel= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 220, 300, 35)];
        [theScrollView  addSubview:bottlerTel];
        
        [bottlerTel  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:28]];
        bottlerTel.textColor = [UIColor darkGrayColor];
        [bottlerTel setTextAlignment:UITextAlignmentCenter]; //to center text in the UILabel
        bottlerTel.text = @"Telephone";
        
        
        bottlerNameTextField.textColor = [UIColor darkGrayColor];
        bottlerNameTextField.text =bottlerName;
        
        [self.view addSubview:theScrollView];
        
        theScrollView.showsVerticalScrollIndicator=NO;
        theScrollView.scrollEnabled=YES;
        theScrollView.userInteractionEnabled=YES;
        theScrollView.contentSize = CGSizeMake(SCREEN_WIDTH,SCREEN_HEIGHT);
        
        
        theScrollView.delegate = self;
        
        self.title = countryName;
        
        IDforBottler = bottlerID;
        
        self.view.backgroundColor = [UIColor whiteColor];

        
        if ([bottlerName isEqualToString:nil]) {
            bottlerName = @"";
            bottlerNameTextField.text =bottlerName;

        }else{
            //Text Field for Bottler Name
            
            bottlerNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 80, 300, 35)];
            [theScrollView  addSubview:bottlerNameTextField];
            
            bottlerNameTextField.textAlignment  = UITextAlignmentCenter;
            [bottlerNameTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

            bottlerNameTextField.textColor = [UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];
            
            bottlerNameTextField.text =bottlerName;
            
            bottlerNameTextField.delegate = self;

        }
        
        
        if ([bottlerAddress isEqualToString:nil]) {
            bottlerAddress = @"";
            bottlerAddressTextField.text =bottlerAddress;

        }else{
            //Text Field for Bottler Address
            
            bottlerAddressTextField = [[UITextView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 150, 300, 70)];
            [theScrollView  addSubview:bottlerAddressTextField];
            
            bottlerAddressTextField.textAlignment  = UITextAlignmentCenter;
            
            [bottlerAddressTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

            bottlerAddressTextField.textColor = [UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];

            bottlerAddressTextField.text =bottlerAddress;
            
            bottlerAddressTextField.delegate = self;

        }
        
        
        if ([bottlerTelephone isEqualToString:nil]) {
            
            bottlerTelephone = @"";
            bottlerTelephoneTextField.text =bottlerTelephone;

        }else{
            
            //Text Field for Bottler Telephone
            
            bottlerTelephoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 250, 300, 35)];
            [theScrollView addSubview:bottlerTelephoneTextField];
            
            bottlerTelephoneTextField.textAlignment  = UITextAlignmentCenter;

            
            [bottlerTelephoneTextField  setFont: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

            
            bottlerTelephoneTextField.text =bottlerTelephone;
            bottlerTelephoneTextField.textColor = [UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];

            bottlerTelephoneTextField.delegate = self;

        }
        
        updateButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-75, SCREEN_HEIGHT-180, 150, 50)];
        
        [theScrollView  addSubview:updateButton];
        
        updateButton.backgroundColor = [UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];
        
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton addTarget:self action:@selector(updateButton) forControlEvents:UIControlEventTouchUpInside];
        [updateButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];

        updateButton.layer.cornerRadius = 10; // this value vary as per your desire
        updateButton.clipsToBounds = YES;
        
        NSLog(@"NAME :%@     TEL: %@      ADD:%@",bottlerNameTextField.text, bottlerTelephoneTextField.text, bottlerAddressTextField.text);

        
    }
    return self;
}

- (void) updateButton{

    statusofUpdate = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 100, 80)];
    
    [theScrollView addSubview:statusofUpdate];
    
    
    
    NSLog(@"NAME :%@     TEL: %@      ADD:%@",bottlerNameTextField.text, bottlerTelephoneTextField.text, bottlerAddressTextField.text);
    
    NSDictionary * fields = [NSDictionary dictionaryWithObjectsAndKeys:bottlerNameTextField.text,@"Bottler_Name__c",
                             bottlerAddressTextField.text,@"Address__c",
                             bottlerTelephoneTextField.text,@"Telephone__c",nil];
    
    SFRestRequest * request = [[SFRestAPI sharedInstance] requestForUpdateWithObjectType:@"Location__c" objectId:IDforBottler fields:fields];
    
    [[SFRestAPI sharedInstance] send:request delegate:self];
    
}

- (void) request:(SFRestRequest *)request didLoadResponse:(id)jsonResponse{
 
    NSLog(@"1 Record Updated");
    
//    statusofUpdate.text = @"1 Record Updated";
//    
//    statusofUpdate.textColor = [UIColor redColor];
    
}


- (void)keyboardWasShown:(NSNotification *)notification
{
    
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // Step 2: Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    theScrollView.contentInset = contentInsets;
    theScrollView.scrollIndicatorInsets = contentInsets;
    
    
    // Step 3: Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, bottlerNameTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, bottlerNameTextField.frame.origin.y - (keyboardSize.height-15));
        [theScrollView setContentOffset:scrollPoint animated:YES];
    }
}




- (void)textFieldDidEndEditing:(UITextField *)textField
{
    bottlerNameTextField = nil;
    
    bottlerAddressTextField = nil;
    
    bottlerTelephoneTextField = nil;


}

- (void)viewWillAppear:(BOOL)animated {
    
    

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    
    [self.navigationController setNavigationBarHidden:NO animated:animated]; [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];

    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:0.855f green:0.024f blue:0.035f alpha:1.0f];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    bottlerTelephoneTextField.inputAccessoryView = numberToolbar;
    bottlerNameTextField.inputAccessoryView = numberToolbar;
    bottlerAddressTextField.inputAccessoryView = numberToolbar;
    NSLog(@"NAME :%@     TEL: %@      ADD:%@",bottlerNameTextField.text, bottlerTelephoneTextField.text, bottlerAddressTextField.text);


}

-(void)cancelNumberPad{
    NSLog(@"NAME :%@     TEL: %@      ADD:%@",bottlerNameTextField.text, bottlerTelephoneTextField.text, bottlerAddressTextField.text);
    [self updateButton];

    [bottlerTelephoneTextField resignFirstResponder];
    [bottlerNameTextField resignFirstResponder];
    [bottlerAddressTextField resignFirstResponder];

}

-(void)doneWithNumberPad{
    [self cancelNumberPad];
    
}


#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -35.0f;  //set the -35.0f to your required value
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
    
}

@end
