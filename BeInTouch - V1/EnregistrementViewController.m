//
//  EnregistrementViewController.m
//  BeInTouch
//
//  Created by Aliou GUEYE on 10.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import "EnregistrementViewController.h"
#import "UtilisateurDTO.h"
#import "UtilisateurFacade.h"




@interface EnregistrementViewController ()



@end

@implementation EnregistrementViewController

#pragma mark - Propriétés
@synthesize textPrenom;
@synthesize textNom;
@synthesize textSexe;
@synthesize textDateNaissance;
@synthesize textCourriel;
@synthesize textTelephone;


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
- (void)chargerInfo {
    
    
    // Charge les données de l'enregistrement de la base de données
    UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade] readUtilisateur:[self idUtilisateur]];
    
    
    
    //Met a jour les valeurs des text fields de l'interface avec les données de l'enregistrement lu
    if(utilisateurDTO != nil) {
        [[self textPrenom]setText:[utilisateurDTO prenom]];
        [[self textNom] setText:[utilisateurDTO nom]];
        [[self textSexe] setText:[utilisateurDTO sexe]];
        [[self textDateNaissance] setText:[utilisateurDTO dateNaissance]];
        [[self textCourriel] setText:[utilisateurDTO courriel]];
        [[self textTelephone] setText:[utilisateurDTO telephone]];
        
        
        NSLog(@"Requête de lecture réussie pour l'enregistrement %@\n\n", [utilisateurDTO idUtilisateur]);
    }
    else {
        NSLog(@"Impossible d'exécuter la rêquete de lecture\n\n");
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self textPrenom] setDelegate:self];
    [[self textNom] setDelegate:self];
    [[self textSexe] setDelegate:self];
    [[self textDateNaissance] setDelegate:self];
    [[self textCourriel] setDelegate:self];
    [[self textTelephone] setDelegate:self];
    
    
    
    // Vérifie si le paramètre de modification d'un enregistrement a été assigné
    if ([self idUtilisateur] != nil) {
        // Charge l'enregistrement correspondant
        [self chargerInfo];
    }
    
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

- (IBAction)btnEnregistrer:(id)sender {
}
@end
