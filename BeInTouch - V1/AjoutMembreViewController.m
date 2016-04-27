//
//  AjoutMembreViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "AjoutMembreViewController.h"
#import "ContactFacade.h"
#import "ContactFacade.h"
#import "UtilisateurFacade.h"

@interface AjoutMembreViewController ()
@property (strong,nonatomic) NSMutableArray* membres;
- (void)chargerDonnees;

@end

@implementation AjoutMembreViewController
@synthesize idUtilisateur;
@synthesize idChatRoom;
@synthesize idContact;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)chargerDonnees {
    // Charge les données
    if ([self membres] != nil) {
        [self setMembres:nil];
    }
    [self setMembres:[[ContactFacade contactFacade] getAllContacts:[self idUtilisateur]]];
    // Recharge la table view
    [[self tv] reloadData];
    NSLog(@"ajoutMembre idUtilisateur = %@",idUtilisateur);
    NSLog(@"ajoutMembre idchatroom = %@",idChatRoom);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[self tv] setDelegate:self];
    [[self tv] setDataSource:self];
    [self chargerDonnees];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self membres] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UtilisateurDTO* membresDTO = [[self membres] objectAtIndex:[indexPath row]];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"IdCellAjout" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"IdCellAjout"];
    }
    
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@", [membresDTO prenom], [membresDTO nom]]];
    
    
    
    return cell;
}


// Pour gérer le checkMark
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    NSString *cellText = cell.textLabel.text;
    NSLog(@"%@",cellText);
    UtilisateurDTO* membresDTO = [[self membres] objectAtIndex:[indexPath row]];
    
    [self setIdContact:[membresDTO idUtilisateur]];
    
    NSLog(@"ajoutMembre idcontact = %@",idContact);

    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

@end
