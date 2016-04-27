//
//  ChatRoomTableViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "ChatRoomTableViewController.h"
#import "ChatRoomDTO.h"
#import "ChatRoomFacade.h"
#import "DetailChatRoomViewController.h"
#import "ContactChatRoomFacade.h"
#import "NouveauChatRoomViewController.h"

@interface ChatRoomTableViewController ()

@end

@implementation ChatRoomTableViewController

#pragma mark - Proprietés privées
@synthesize  chatRooms;
@synthesize contactChatRooms;

@synthesize  idUtilisateur;
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nouveauChatRoom"]){
        
        NouveauChatRoomViewController* nouveauTchatRoomViewController = [segue destinationViewController];
        [nouveauTchatRoomViewController setIdUtilisateur:[self idUtilisateur]];
        NSLog(@"chatroom idutilisateur = , %@",idUtilisateur);
    }else if ([segue.identifier isEqualToString:@"sujetChat"]){
        /*
        DetailChatRoomViewController* detailTchatRoomViewController = [segue destinationViewController];
        [detailTchatRoomViewController setIdUtilisateur:[self idUtilisateur]];
        NSLog(@"Requete , %@",idUtilisateur);*/
    }

    
}

-(IBAction)AjoutMembre:(UIStoryboardSegue*) segue
{
    NSLog(@"retour de ajout membre");
    // Recharge la table view
    [self chargerDonnees];
    
}

@end
