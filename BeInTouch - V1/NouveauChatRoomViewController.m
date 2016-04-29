//
//  NouveauChatRoomViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "NouveauChatRoomViewController.h"
#import "AjoutMembreViewController.h"

@interface NouveauChatRoomViewController ()

@end

@implementation NouveauChatRoomViewController
#pragma mark - Propriétés
@synthesize textSujetChat;
@synthesize idUtilisateur;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Méthodes privées

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[[self navigationController] navigationBar] setTintColor:[[[self navigationItem] rightBarButtonItem] tintColor]];
    
    [[self textSujetChat] setDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gestion du clavier
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"ajoutMembre"]){
        
        AjoutMembreViewController* ajoutMembreViewController = [segue destinationViewController];
        
         //envoie des id dans ajouterMembreViewController
         ajoutMembreViewController.idUtilisateur =  idUtilisateur;
         ajoutMembreViewController.sujet =  textSujetChat.text;
        
        NSLog(@"nouveauchatroom idUtilisateur = %@",idUtilisateur);
        NSLog(@"nouveauchatroom idchatroom = %@",textSujetChat.text);
        
    }
    
    
}


-(IBAction)AnnulerAjoutMembre:(UIStoryboardSegue*) segue{
    
}


@end
