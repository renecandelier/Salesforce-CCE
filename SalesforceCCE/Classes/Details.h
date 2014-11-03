//
//  Details.h
//  SalesforceCCE
//
//  Created by Rene Candelier on 11/2/14.
//  Copyright (c) 2014 CCE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFRestAPI.h"

@interface Details : UIViewController <SFRestDelegate>


-(id) initWithName:(NSString *)countryName
           bottler:(NSString *)bottlerName
           address:(NSString *)bottlerAddress
         telephone:(NSString *)bottlerTelephone
                ID:(NSString *)bottlerID;




@end
