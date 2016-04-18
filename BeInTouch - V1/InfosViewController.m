//
//  InfosViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "InfosViewController.h"
#import "UtilisateurFacade.h"
#import "UtilisateurDTO.h"

@interface InfosViewController ()

@end

@implementation InfosViewController

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

- (void)chargerInfo {
    
    UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:[self idUtilisateur]];
   // [[self lblIdUtilisateur] setText:[utilisateurDTO idUtilisateur]];
   // [[self textPrenom] setText:[utilisateurDTO prenom]];
   // [[self textNom] setText:[utilisateurDTO nom]];
   // [[self textSexe] setText:[utilisateurDTO sexe]];
   // [[self textDateNaissance] setText:[utilisateurDTO dateNaissance]];
   // [[self textCourriel] setText:[utilisateurDTO courriel]];
   // [[self textTelephone] setText:[utilisateurDTO telephone]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self chargerInfo];
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

@end
