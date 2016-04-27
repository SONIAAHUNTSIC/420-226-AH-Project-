//
//  NouveauChatRoomViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "NouveauChatRoomViewController.h"
#import "AjoutMembreViewController.h"
#import "ChatRoomDTO.h"
#import "ChatRoomFacade.h"

@interface NouveauChatRoomViewController ()

@end

@implementation NouveauChatRoomViewController
#pragma mark - Propriétés
@synthesize textSujetChat;
@synthesize idUtilisateur;
@synthesize idChatRoom;
//@synthesize idEnregistre;



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
    ChatRoomDTO *chatroomDTO = [[ChatRoomFacade chatRoomFacade] readChatRoom:[self idChatRoom]];
    
    
    
    //Met a jour les valeurs des text fields de l'interface avec les données de l'enregistrement lu
    if(chatroomDTO != nil) {
        [[self textSujetChat]setText:[chatroomDTO sujet]];
        
        NSLog(@"Requête de lecture réussie pour l'enregistrement %@\n\n", [chatroomDTO idChatRoom]);
    }
    else {
        NSLog(@"Impossible d'exécuter la rêquete de lecture\n\n");
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[[self navigationController] navigationBar] setTintColor:[[[self navigationItem] rightBarButtonItem] tintColor]];
    
    [[self textSujetChat] setDelegate:self];
    
    // Vérifie si le paramètre de modification d'un enregistrement a été assigné
    if ([self idChatRoom] != nil) {
        // Charge l'enregistrement correspondant
        [self chargerInfo];
    }
    
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
    
    ChatRoomDTO* chatroomDTO = [[ChatRoomDTO alloc] initAvecIdChatRoom:idChatRoom
                                                                 sujet:textSujetChat.text dateCreation:@"UnDateCreation" etDateFermeture:@"UnDatefermeture"];
    
    NSLog(@"%@",textSujetChat.text);
    
    if([[chatroomDTO sujet] length] != 0) {
        int nombreEnregistrements = 0;
        int intEnregistre = 0;
        
        NSString* typeRequete = [chatroomDTO idChatRoom] != nil ? @"mise a jour ":@"création";
        
        NSString* typeRequeteAction = [chatroomDTO idChatRoom] != nil ? @"mis a jour " : @"crée(s)";
        
        if ([chatroomDTO idChatRoom] !=nil){
            nombreEnregistrements = [[ChatRoomFacade chatRoomFacade] updateChatRoom:chatroomDTO];
            
        }
        else {
            intEnregistre = [[ChatRoomFacade chatRoomFacade] createChatRoom:chatroomDTO];
            idChatRoom = [NSString stringWithFormat:@"%d", intEnregistre];
            
            
            
            //NSLog(@"Requete de %@ , %d enregistrement(s) %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
            
        }
        if (nombreEnregistrements > 0){
            NSLog(@"Requete de %@ reussie, %d enregistrement(s) %@\n\n",typeRequete,nombreEnregistrements,typeRequeteAction);
            
        }
        else if (intEnregistre !=0){
            NSLog(@"Requete de %@ reussie, %d enregistre  %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
            
        }
        else {
            NSLog(@"Impossible d'exécuter la requêtede %@ \n\n",typeRequete);
        }
        
    }
    
    if([segue.identifier isEqualToString:@"ajoutMembre"]){
        
        
        AjoutMembreViewController* ajoutMembreViewController = [segue destinationViewController];
         
         ajoutMembreViewController.idUtilisateur =  idUtilisateur;
         ajoutMembreViewController.idChatRoom =  idChatRoom;
        
        NSLog(@"nouveauchatroom idUtilisateur = %@",idUtilisateur);
        NSLog(@"nouveauchatroom idchatroom = %@",idChatRoom);
        
    }
    
    
}


-(IBAction)AnnulerAjoutMembre:(UIStoryboardSegue*) segue{
    
}


@end
