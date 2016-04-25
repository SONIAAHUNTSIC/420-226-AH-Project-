//
//  VoirAmiViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "VoirAmiViewController.h"
#import "ContactFacade.h"
#import "ContactDTO.h"
#import "UtilisateurDTO.h"

@interface VoirAmiViewController ()

#pragma mark - Propriétés privées
@property (strong, nonatomic) NSMutableArray* amis;


#pragma mark - Méthodes privées
- (void)listerAmis;

@end

@implementation VoirAmiViewController


#pragma mark - Propriétés
@synthesize amis;
@synthesize idUtilisateur;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)listerAmis {
    
    
    // Charger les données
    if ([self amis] != nil) {
        [self setAmis:nil];
    }
    
    [self setAmis:[[ContactFacade contactFacade]getAllContacts:[self idUtilisateur]]];
        
       /* ContactDTO* contactDTO = [[ContactDTO alloc] init];
        
        for(int i=0 ; i < [ amis count]; ++i) {
            
            contactDTO = [amis objectAtIndex:i];
            
        }*/
    
    // Recharge la table view
    [[self tableView] reloadData];
    // Dans la méthode qui fait la transaction réseau, après la transaction réseau :
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        // Appel de la méthode qui fait une transaction réseau.
        [self listerAmis];
    });
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[self amis] count];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
     UtilisateurDTO* amisDTO = [[self amis] objectAtIndex:[indexPath row]];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"idAmis" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idAmis"];
    }
    
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@", [amisDTO prenom], [amisDTO nom]]];
    
     NSLog(@"prenom  %@",[amisDTO prenom ]);
    
    return cell;
}


-(IBAction)returnFromVoirAmis:(UIStoryboardSegue*) segue{
    
}

@end
