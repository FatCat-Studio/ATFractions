//
//  ViewController.m
//  ATFractions
//
//  Created by Александр on 23.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

int nod (int a, int b) 
{ 
    return b == 0 ? (a == 0 ? EOF : abs(a)) : abs(nod(b, a % b));
}
void conversion (int a, int b)
{
    int q = nod(a,b); 
    a /= q;
    b /= q;
}
@implementation ViewController

-(IBAction)compulate:(id)sender
{
    int n1 = [[numerator1 text] intValue];
    int dn1 = [[denomerator1 text] intValue];
    
    int n2 = [[numerator2 text] intValue];
    int dn2 = [[denomerator2 text] intValue];
    
    const char *symb = [[symbol text] cStringUsingEncoding:NSASCIIStringEncoding];
    
    int ResultNumerator;
    int ResultDenomerator;
    
    switch (*symb) 
    {
            int q;
            if ((dn1 == 0)||(dn2 == 0))
            {
                [result setText:[NSString stringWithFormat:@"Ошибка!"]];
            }
        case '*': 
            ResultNumerator = n1*n2; 
            ResultDenomerator = dn1*dn2;
            q = nod(ResultNumerator,ResultDenomerator); 
            ResultNumerator /= q;
            ResultDenomerator /= q;
            [result setText:[NSString stringWithFormat:@"%i/%i",ResultNumerator,ResultDenomerator]];
            break;
        case '+': 
            if (dn1 == dn2)
            {
                ResultNumerator = n1+n2;
                ResultDenomerator = dn1;
            }
            else {
                ResultNumerator = n1*dn2+n2*dn1; 
                ResultDenomerator = dn1*dn2; 
                q = nod(ResultNumerator,ResultDenomerator); 
                ResultNumerator /= q;
                ResultDenomerator /= q;
            }
                [result setText:[NSString stringWithFormat:@"%i/%i",ResultNumerator,ResultDenomerator]];
            break;
        case '-':
            if (dn1 == dn2)
            {
                ResultNumerator = n1-n2;
                ResultDenomerator = dn1;
            }
            else {
                ResultNumerator = n1*dn2-n2*dn1;
                ResultDenomerator = dn1*dn2;
                q = nod(ResultNumerator,ResultDenomerator); 
                ResultNumerator /= q;
                ResultDenomerator /= q;
            }
            [result setText:[NSString stringWithFormat:@"%i/%i",ResultNumerator,ResultDenomerator]];
            break;
        case '/': case ':' : 
            ResultNumerator = n1*dn2;
            ResultDenomerator = n2*dn1;
            q = nod(ResultNumerator,ResultDenomerator); 
            ResultNumerator /= q;
            ResultDenomerator /= q;
            [result setText:[NSString stringWithFormat:@"%i/%i",ResultNumerator,ResultDenomerator]];
            break;
        
        default:
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
