//
//  BienvenuViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//
#import "BienvenuViewController.h"
#import "InfosViewController.h"
#import "VoirAmiViewController.h"
#import "AjouterAmisViewController.h"
#import "ChatRoomTableViewController.h"

@interface BienvenuViewController ()


@end

@implementation BienvenuViewController


#pragma mark - Propriétés
@synthesize idUtilisateur;

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
#pragma mark - prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
    
    NSLog(@"prepare for Segue to ");
    
    if([segue.identifier isEqualToString:@"segueInfo"]){
        
        InfosViewController* infosViewController = [segue destinationViewController];
        [infosViewController setIdUtilisateur:[self idUtilisateur]];
        NSLog(@"Requete segue Info, %@",idUtilisateur);
    }
    else if ([segue.identifier isEqualToString:@"segueAjouter1"]){

            AjouterAmisViewController* ajouterAmisViewController = [segue destinationViewController];
            [ajouterAmisViewController setIdUtilisateur:[self idUtilisateur]];
            NSLog(@"Requete , %@",idUtilisateur);
        
        
    }
    else if ([segue.identifier isEqualToString:@"segueVoirAmis"]){
        
        
        VoirAmiViewController* voirAmiViewController = [segue destinationViewController];
        [voirAmiViewController setIdUtilisateur:[self idUtilisateur]];
        NSLog(@"Requete , %@",idUtilisateur);
    }
    else if ([segue.identifier isEqualToString:@"segueCreerChatRoom"]){
        
        
        UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        ChatRoomTableViewController *controller = (ChatRoomTableViewController *)[navController topViewController];
        [controller setIdUtilisateur:[self idUtilisateur]];
        
    }
}

-(IBAction)returnFromInfos:(UIStoryboardSegue*) segue{
    
    NSLog(@"Return From Info");
    
}

-(IBAction)returnFromAjouterAmis:(UIStoryboardSegue*) segue{
    NSLog(@"Return from Ajouter Amis");
    
}

-(IBAction)returnFromVoirAmis:(UIStoryboardSegue*) segue{
    
    NSLog(@"Return from Voir Amis");
    
}


-(IBAction)returnFromChatRoom:(UIStoryboardSegue*) segue{
    
}

@end
