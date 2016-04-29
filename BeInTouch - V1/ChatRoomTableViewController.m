//
//  ChatRoomTableViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "ChatRoomTableViewController.h"
#import "UtilisateurFacade.h"
#import "ChatRoomFacade.h"
#import "DetailChatRoomViewController.h"
#import "ContactChatRoomFacade.h"
#import "NouveauChatRoomViewController.h"
#import "AjoutMembreViewController.h"

@interface ChatRoomTableViewController ()

@end

@implementation ChatRoomTableViewController

#pragma mark - Proprietés privées
@synthesize  chatRooms;
@synthesize contactChatRooms;

@synthesize idUtilisateur;
@synthesize idChatRoom;



#pragma mark - Méthodes privées
- (void)chargerDonnees {
    
    // Charge les données
   if ([self chatRooms] !=nil){
        
        
        [self setChatRooms:nil];
   }
    
    self.chatRooms = [[NSMutableArray alloc] init];


    [self setContactChatRooms:[[ContactChatRoomFacade  contactChatRoomFacade]getAllContactChatRooms:[self idUtilisateur]]];
    
     ContactChatRoomDTO* contactChatRoom = [[ContactChatRoomDTO alloc] init];
     ChatRoomDTO *unChatRoomDTO = [[ChatRoomDTO alloc]init];
    
    
    for(int i=0 ; i < [ contactChatRooms count]; ++i) {
        
        contactChatRoom = [contactChatRooms objectAtIndex:i];
        
         unChatRoomDTO =  [contactChatRoom chatRoom];
        
         [chatRooms addObject:unChatRoomDTO];

    }
    
    // Recharge la table view
    [[self tableView] reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    [self chargerDonnees];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [chatRooms count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ChatRoomDTO* chatRoomDTO = [[self chatRooms]objectAtIndex:[indexPath row]];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCell" forIndexPath:indexPath];
    
    if (cell== nil){
        cell = [[UITableViewCell alloc] initWithStyle:
        UITableViewCellStyleSubtitle reuseIdentifier:@"idCell"];
    }
    
    // Mettre à jour les labels des celules de la table avec les données de l'enregistrement lu à partir de la base de données
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@", [chatRoomDTO sujet]]] ;
     NSLog(@"sujet  %@",[chatRoomDTO sujet ]);


    
    return cell;
}
- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    
    ChatRoomDTO* chatRoomDTO = [[self chatRooms]  objectAtIndex:[indexPath row]];
    
    // Passe la clef primaire au prochain view controller pour qu'il charge les données de l'enregistrement
    [self setIdChatRoom:[chatRoomDTO idChatRoom]];
    [self performSegueWithIdentifier:@"sujetChat" sender:self];
    NSLog(@"sujet %@",[chatRoomDTO idChatRoom]);
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nouveauChatRoom"]){
        
        NouveauChatRoomViewController* nouveauTchatRoomViewController = [segue destinationViewController];
        [nouveauTchatRoomViewController setIdUtilisateur:[self idUtilisateur]];
        NSLog(@"chatroom idutilisateur = , %@",idUtilisateur);
    }else if ([segue.identifier isEqualToString:@"sujetChat"]){
    
        DetailChatRoomViewController* detailChatRoomViewController = [segue destinationViewController];
        [detailChatRoomViewController setIdUtilisateur:[self idUtilisateur]];
        [detailChatRoomViewController setIdChatRoom:[self idChatRoom]];
        NSLog(@"Requete , %@",idUtilisateur);
    }

    
}

-(IBAction)AjoutMembre:(UIStoryboardSegue*) segue
{
    NSLog(@"retour de ajout membre");
    
    AjoutMembreViewController *ajoutMembreViewController = [segue  sourceViewController];
    
    ChatRoomDTO* chatroomDTO = [[ChatRoomDTO alloc] initAvecIdChatRoom:idChatRoom
                                                sujet:[ajoutMembreViewController sujet]
                                                dateCreation:@""
                                                etDateFermeture:@""];
    if ([ajoutMembreViewController idUtilisateur] == nil
        ||[ajoutMembreViewController idContact] == nil
        ||[[chatroomDTO sujet]  isEqual:@""])
    {
        NSLog(@"Impossible de créer la chatroom");
    }else{
        int intEnregistre = 0;
        NSLog(@"%@",[chatroomDTO sujet]);
        
        intEnregistre = [[ChatRoomFacade chatRoomFacade] createChatRoom:chatroomDTO];
        
        NSLog(@"%d",intEnregistre);
        if (intEnregistre != 0)
        {
            idChatRoom = [NSString stringWithFormat:@"%d", intEnregistre];
            NSLog(@"Requete de création reussie idChatroom =, %d ",intEnregistre);
         
         }
         else {
         NSLog(@"Impossible d'exécuter la requêtede");
         }

        UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:[ajoutMembreViewController idUtilisateur]];
    
        UtilisateurDTO *contactDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:[ajoutMembreViewController idContact]];
    
        ChatRoomDTO *chatRoomDTO = [[ChatRoomFacade chatRoomFacade]readChatRoom:idChatRoom];
    
        ContactChatRoomDTO *contactChatRoomDTO = [[ContactChatRoomDTO alloc] initAvecUtilisateur:utilisateurDTO chatRoom:chatRoomDTO utilisateurContact:contactDTO swAdmin:@"1" swCreateur:@"1" dateDebut:@"dateDebut" SwActif:@"1" etDateDepart:@"dateDepart"];
    
        if([contactChatRoomDTO utilisateur] != nil
           && [contactChatRoomDTO chatRoom] != nil
           && [contactChatRoomDTO utilisateurContact] != nil )
        {
            int intEnregistre = 0;
            intEnregistre = [[ContactChatRoomFacade contactChatRoomFacade] createContactChatRoom:contactChatRoomDTO];
            if (intEnregistre == 1) {
                NSLog(@"Requete reussie");
                // Recharge la table view
                [self chargerDonnees];
            }
            else {
            NSLog(@"Impossible d'exécuter la requête");
            }
        }
    }
}

@end
