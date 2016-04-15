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
    
    
    
    UtilisateurDTO* utilisateurDTO = [[UtilisateurDTO alloc]initAvecIdUtilisateur:idUtilisateur
                                    prenom: textPrenom.text
                                    nom: textNom.text
                                    sexe:textSexe.text
                                    dateCreation: @"2016 "
                                    dateNaissance:textDateNaissance.text
                                    photo:@"Un photo"
                                    courriel:textCourriel.text
                                    etTelephone:textTelephone.text];
    
    
        
    
    
    if([[utilisateurDTO prenom] length] != 0
       && [[utilisateurDTO nom] length] != 0
       && [[utilisateurDTO sexe]length] != 0) {
        int nombreEnregistrements = 0;
        NSString* typeRequete = [utilisateurDTO idUtilisateur] != nil ? @"mise a jour ":@"création";
        
        NSString* typeRequeteAction = [utilisateurDTO idUtilisateur] != nil ? @"mis a jour " : @"crée(s)";
        
        
        
        // Si la personne à un id diferente de nil, on fait  une mise à jour. Sinon, on fait un ajout
        //Parler de save vs create update
        if ([utilisateurDTO idUtilisateur] !=nil){
            nombreEnregistrements = [[UtilisateurFacade utilisateurFacade] updateUtilisateur:utilisateurDTO];
            
        }
        else {
            nombreEnregistrements = [[UtilisateurFacade utilisateurFacade] createUtilisateur:utilisateurDTO];
            NSLog(@"test enregistrer");
            NSLog(@"Requete de %@ , %d enregistrement(s) %@\n\n",typeRequete,nombreEnregistrements,typeRequeteAction);
        }
        if (nombreEnregistrements > 0){
            NSLog(@"Requete de %@ reussie, %d enregistrement(s) %@\n\n",typeRequete,nombreEnregistrements,typeRequeteAction);
            
        }
        else {
            NSLog(@"Impossible d'exécuter la requêtede %@ \n\n",typeRequete);
        }
        
        
        // Recharge la table view
        // [self chargerDonnees];
    }

    
}
@end
