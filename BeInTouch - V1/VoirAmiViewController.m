//
//  VoirAmiViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "VoirAmiViewController.h"
#import "ContactFacade.h"
#import "UtilisateurFacade.h"

@interface VoirAmiViewController ()

#pragma mark - Propriétés privées
@property (strong,nonatomic) NSMutableArray* membres;
- (void)chargerDonnees;

@end

@implementation VoirAmiViewController
@synthesize idUtilisateur;

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
    [[self tableView] reloadData];
    NSLog(@"ajoutMembre idUtilisateur = %@",idUtilisateur);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
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
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"idAmis" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idAmis"];
    }
    
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@", [membresDTO prenom], [membresDTO nom]]];
    
    
    
    return cell;
}

-(IBAction)returnFromVoirAmis:(UIStoryboardSegue*) segue{
    
}


@end
