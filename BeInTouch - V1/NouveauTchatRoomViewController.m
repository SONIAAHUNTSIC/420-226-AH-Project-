//
//  NouveauTchatRoomViewController.m
//  BeInTouch
//
//  Created by Aliou GUEYE on 12.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import "NouveauTchatRoomViewController.h"

@interface NouveauTchatRoomViewController ()

@end

@implementation NouveauTchatRoomViewController
#pragma mark - Propriétés
@synthesize txtSujetChat;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[[self navigationController] navigationBar] setTintColor:[[[self navigationItem] rightBarButtonItem] tintColor]];
    
    [[self txtSujetChat] setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Gestion du clavier
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

-(IBAction)AnnulerAjoutMembre:(UIStoryboardSegue*) segue{
    
}

@end
