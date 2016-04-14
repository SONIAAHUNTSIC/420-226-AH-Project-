//
//  UtilisateurViewController.m
//  BeInTouch
//
//  Created by Aliou GUEYE on 12.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import "UtilisateurViewController.h"
#import "UtilisateurFacade.h"
#import "EnregistrementViewController.h"

@interface UtilisateurViewController ()

@end

@implementation UtilisateurViewController

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [maData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    
    //NSString *cellValue = [maData objectAtIndex:indexPath.row];
   // cell.textLabel.text = cellValue;
    return cell;
}

- (IBAction)segueEnregistrer:(UIStoryboardSegue*)returnSegue {
    
    EnregistrementViewController* enregistrementViewController = [returnSegue sourceViewController];
    
    AdresseDTO* adresseU = [[AdresseDTO alloc]initAvecIdAdresse:[ enregistrementViewController idAdresse]
                                    rue:[[enregistrementViewController textRue] text]
                                    appartement:[[enregistrementViewController textAppartement] text]
                                    codePostal:[[enregistrementViewController textCodePostal] text]
                                    ville:[[enregistrementViewController textVille] text]
                                    province:[[enregistrementViewController textProvince] text]
                                    etPays:[[enregistrementViewController textPays] text]];
    
//    
//    UtilisateurDTO* utilisateurDTO = [[[UtilisateurDTO alloc]initAvecIdUtilisateur:[ enregistrementViewController idUtilisateur]
//                                    prenom:[[enregistrementViewController textPrenom]text]
//                                    nom:[[enregistrementViewController textNom] text]
//                                    sexe:[[enregistrementViewController textSexe] text]
//                                    dateNaissance:[[enregistrementViewController textDateNaissance] text]
//                                    courriel:[[enregistrementViewController textCourriel] text]
//                                    telephone:[[enregistrementViewController textTelephone] text]
//                                                                         etAdresse:[[enregistrementViewController adresseEnregistre]];
//                                
//    
//                                      
//
//    if([[utilisateurDTO prenom] length] != 0
//       && [[utilisateurDTO nom] length] != 0
//       && [[utilisateurDTO sexe]length] > 0) {
//        int nombreEnregistrements = 0;
//        NSString* typeRequete = [utilisateurDTO idUtilisateur] != nil ? @"mise a jour ":@"création";
//        
//        NSString* typeRequeteAction = [utilisateurDTO idUtilisateur] != nil ? @"mis a jour " : @"crée(s)";
//        
//        
//        
//        // Si la personne à un id diferente de nil, on fait  une mise à jour. Sinon, on fait un ajout
//        //Parler de save vs create update
//        if ([utilisateurDTO idUtilisateur] !=nil){
//            nombreEnregistrements = [[UtilisateurFacade utilisateurFacade] updateUtilisateur:utilisateurDTO];
//            
//        }
//        else {
//            nombreEnregistrements = [[UtilisateurFacade utilisateurFacade] createUtilisateur:utilisateurDTO];
//            NSLog(@"Requete de %@ , %d enregistrement(s) %@\n\n",typeRequete,nombreEnregistrements,typeRequeteAction);
//        }
//        if (nombreEnregistrements > 0){
//            NSLog(@"Requete de %@ reussie, %d enregistrement(s) %@\n\n",typeRequete,nombreEnregistrements,typeRequeteAction);
//            
//        }
//        else {
//            NSLog(@"Impossible d'exécuter la requêtede %@ \n\n",typeRequete);
//        }
//        
//        
//        // Recharge la table view
//        [self chargerDonnees];
//}
                                   
    }




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

-(IBAction)returnFormUtilisateur:(UIStoryboardSegue*) segue{
    
}

-(IBAction)returnFromListeMembres:(UIStoryboardSegue*) segue{
    
}

@end
