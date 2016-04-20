//
//  AccueilViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "AccueilViewController.h"
#import "BienvenuViewController.h"

@interface AccueilViewController ()

@end

@implementation AccueilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[[self navigationController] navigationBar] setTintColor:[[[self navigationItem] rightBarButtonItem] tintColor]];
    
    [[self textIdConnecter] setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"segueConnecter"]){
        
        if ([_textIdConnecter.text  isEqual: @""]) {
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Vous devez entrer son ID" message:@"Pour se connecter" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            NSLog(@"alert view: %@ = id\n",_textIdConnecter.text);
            
        }
        else {
            BienvenuViewController* bienvenuViewController = [segue destinationViewController];
            
            bienvenuViewController.idUtilisateur =  _textIdConnecter.text;
            NSLog(@"Prepare for Segue : %@ = id\n",_textIdConnecter.text);
            
        }
    }

}

-(IBAction)returnFromEnregistrement:(UIStoryboardSegue*) segue{
    
}


- (IBAction)btnConnecter:(id)sender {
    
    
}

@end
