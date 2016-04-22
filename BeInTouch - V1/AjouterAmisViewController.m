//
//  AjouterAmisViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "AjouterAmisViewController.h"
#import "UtilisateurFacade.h"
#import "ContactFacade.h"

@interface AjouterAmisViewController ()

@end

@implementation AjouterAmisViewController

#pragma mark - Propriétés
@synthesize txtId;
@synthesize idUtilisateur;
@synthesize idContact;


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
    
     [[self txtId] setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gestion du clavier
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)btnAjouter:(id)sender {
    
   UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:idUtilisateur];
    
   UtilisateurDTO *utilisateurContactDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:txtId.text];

    NSString* typeRequete = [utilisateurDTO idUtilisateur] != nil ? @"mise a jour ":@"création";
    
    NSString* typeRequeteAction = [utilisateurDTO idUtilisateur] != nil ? @"mis a jour " : @"crée(s)";
    NSLog(@"Requete  avant  %@ , %@ \n\n",[utilisateurDTO idUtilisateur],[utilisateurContactDTO idUtilisateur]);
    
    
    
//    utilisateurDTO =[[UtilisateurDTO alloc] initAvecIdUtilisateur: [utilisateurDTO idUtilisateur]
//                                prenom:[utilisateurDTO prenom]
//                                  nom :[utilisateurDTO nom]
//                                 sexe :[utilisateurDTO sexe]
//                                dateCreation:[utilisateurDTO dateCreation]
//                                dateNaissance:[utilisateurDTO dateNaissance]
//                                photo : [utilisateurDTO photo]
//                             courriel :[utilisateurDTO courriel]
//                            etTelephone : [utilisateurDTO telephone]];
//    
//
//    utilisateurContactDTO =[[UtilisateurDTO alloc] initAvecIdUtilisateur: [utilisateurContactDTO idUtilisateur]
//                                prenom:[utilisateurContactDTO prenom]
//                                  nom :[utilisateurContactDTO nom]
//                                 sexe :[utilisateurContactDTO sexe]
//                          dateCreation:[utilisateurContactDTO dateCreation]
//                         dateNaissance:[utilisateurContactDTO dateNaissance]
//                                photo : [utilisateurContactDTO photo]
//                             courriel :[utilisateurContactDTO courriel]
//                          etTelephone : [utilisateurContactDTO telephone]];
    
    
    
    ContactDTO *contactDTO = [[ContactDTO alloc] initAvecUtilisateurActif:utilisateurDTO
                                                     etUtilisateurContact:utilisateurContactDTO];
                  
    int intEnregistre = [[ContactFacade contactFacade] createContact:contactDTO];
    
      NSLog(@"Requete de %@ , %d enregistrement(s) %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
    
    
    NSString *message = @"Un ami ajouté";
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil, nil];
    [toast show];
    int duration = 1; // in seconds
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
    
    txtId.text = @"";
    
    
}
@end
