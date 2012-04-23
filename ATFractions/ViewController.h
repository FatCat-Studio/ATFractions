//
//  ViewController.h
//  ATFractions
//
//  Created by Александр on 23.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *numerator1;
    IBOutlet UITextField *denomerator1;
    
    IBOutlet UITextField *symbol;
    
    IBOutlet UITextField *numerator2;
    IBOutlet UITextField *denomerator2;
    
    IBOutlet UITextField *result;
}
-(IBAction)compulate:(id)sender;
-(IBAction)getsymbol:(id)sender;
-(void)print;
@end
