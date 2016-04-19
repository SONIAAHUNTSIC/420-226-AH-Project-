//
//  ViewController.m
//  BeInTouch
//
//  Created by Aliou GUEYE on 10.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import "ViewController.h"
#import "BienvenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[[self navigationController] navigationBar] setTintColor:[[[self navigationItem] rightBarButtonItem] tintColor]];
    
    [[self textIdConnecter] setDelegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    
    NSLog(@"prepare for Segue");
    
    if([segue.identifier isEqualToString:@"segueConnecter"]){
        
        
        BienvenuViewController* bienvenuViewController = [segue destinationViewController];
        
        bienvenuViewController.idUtilisateur =  _textIdConnecter.text;
        NSLog(@"Prepare for Segue : %@ = id\n",_textIdConnecter.text);
        
    }
}

-(IBAction)returnFromEnregistrement:(UIStoryboardSegue*) segue{
    
}


- (IBAction)btnConnecter:(id)sender {
    
    
}
@end
