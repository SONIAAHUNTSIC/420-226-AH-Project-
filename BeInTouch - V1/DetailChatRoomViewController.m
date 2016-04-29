//
//  DetailChatRoomViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "DetailChatRoomViewController.h"
#import "UIBubbleTableView.h"
#import "UIBubbleTableViewDataSource.h"
#import "NSBubbleData.h"
#import "ContactChatRoomMessageFacade.h"
#import "ChatRoomFacade.h"
#import "MessageFacade.h"
#import "UtilisateurFacade.h"
#import "ContactChatRoomFacade.h"

@interface DetailChatRoomViewController ()
{
    
    IBOutlet UIBubbleTableView *bubbleTable;
    IBOutlet UIView *textInputView;
    IBOutlet UITextField *textField;
    NSMutableArray * bubbleData;
    
    
}

@end

@implementation DetailChatRoomViewController
#pragma mark - Proprietés privées
@synthesize  messages;
@synthesize  contactsChatRoom;
@synthesize idUtilisateur;
@synthesize idChatRoom;
@synthesize idUtilisateurContact;
@synthesize idMessage;

@synthesize idEnregistre;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  *** Obtiene les messages du tabla contact_chatroom
    
    
    // Charge les données
    if ([self messages] !=nil){
        [self setMessages:nil];
    }
    bubbleData= [[NSMutableArray alloc]init];
    
    self.messages = [[NSMutableArray alloc] init];
    
    [self setMessages:[[ContactChatRoomMessageFacade  contactChatRoomMessageFacade]
                       getAllContactChatRoomMessages:[self idUtilisateur]
                       etChatRoom:[self idChatRoom]]];
    
    // Pour obtenir sujet
    ChatRoomDTO *chatRoomDTO = [[ChatRoomDTO alloc]init];
    
    
    chatRoomDTO = [[ChatRoomFacade chatRoomFacade]readChatRoom:[self idChatRoom]];
    self.title = [chatRoomDTO sujet];
    
    ContactChatRoomMessageDTO * contactChatRoomMessageDTO = [[ContactChatRoomMessageDTO alloc] init];
    MessageDTO *unMessageDTO = [[MessageDTO alloc]init];
    
    NSLog(@"mensajes %lu",(unsigned long)[messages count]);
    bubbleData = [[NSMutableArray alloc] init];
    for(int i=0 ; i < [messages count]; i++) {
        
        contactChatRoomMessageDTO = [messages objectAtIndex:i];
        
        unMessageDTO  = [contactChatRoomMessageDTO message];
        
        
        NSLog(@"mensaje contenu %@ ",[unMessageDTO contenu]);
        NSBubbleData *heyBubble = [NSBubbleData dataWithText:[unMessageDTO contenu] date:[NSDate dateWithTimeIntervalSinceNow:-300] type:BubbleTypeSomeoneElse];
        
        [bubbleData addObject:heyBubble];
        
        
    }
    //NSBubbleData *heyBubble = [NSBubbleData dataWithText:@"sonia" date:[NSDate dateWithTimeIntervalSinceNow:-300] type:BubbleTypeSomeoneElse];
    //heyBubble.avatar = @"xx";
    
    //[bubbleData addObject:heyBubble];
    //bubbleData = [[NSMutableArray alloc] initWithObjects:heyBubble, nil];
    
    
    
    // Recharge la table view
    //[[self tableView] reloadData];
    
    
    
    // Do any additional setup after loading the view.
    //NSBubbleData *heyBubble = [NSBubbleData dataWithText:@"Hey, halloween is soon" date:[NSDate dateWithTimeIntervalSinceNow:-300] type:BubbleTypeSomeoneElse];
    //heyBubble.avatar = [UIImage imageNamed:@"avatar1.png"];
    
    //NSBubbleData *photoBubble = [NSBubbleData dataWithImage:[UIImage imageNamed:@"halloween.jpg"] date:[NSDate dateWithTimeIntervalSinceNow:-290] type:BubbleTypeSomeoneElse];
    //photoBubble.avatar = [UIImage imageNamed:@"avatar1.png"];
    
    //NSBubbleData *replyBubble = [NSBubbleData dataWithText:@"Wow.. Really cool picture out there. iPhone 5 has really nice camera, yeah?" date:[NSDate dateWithTimeIntervalSinceNow:-5] type:BubbleTypeMine];
    //replyBubble.avatar = nil;
    
    //bubbleData = [[NSMutableArray alloc] initWithObjects:heyBubble, photoBubble, replyBubble, nil];
    
    
    bubbleTable.bubbleDataSource = self;
    
    // The line below sets the snap interval in seconds. This defines how the bubbles will be grouped in time.
    // Interval of 120 means that if the next messages comes in 2 minutes since the last message, it will be added into the same group.
    // Groups are delimited with header which contains date and time for the first message in the group.
    
    bubbleTable.snapInterval= 120;
    
    // The line below enables avatar support. Avatar can be specified for each bubble with .avatar property of NSBubbleData.
    // Avatars are enabled for the whole table at once. If particular NSBubbleData misses the avatar, a default placeholder will be set (missingAvatar.png)
    
    bubbleTable.showAvatars = YES;
    
    // Uncomment the line below to add "Now typing" bubble
    // Possible values are
    //    - NSBubbleTypingTypeSomebody - shows "now typing" bubble on the left
    //    - NSBubbleTypingTypeMe - shows "now typing" bubble on the right
    //    - NSBubbleTypingTypeNone - no "now typing" bubble
    
    // bubbleTable.typingBubble = NSBubbleTypingTypeSomebody;
    
    [bubbleTable reloadData];
    
    // Keyboard events
    
    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIBubbleTableViewDataSource implementation

- (NSInteger)rowsForBubbleTable:(UIBubbleTableView *)tableView
{
    return [bubbleData count];
}

- (NSBubbleData *)bubbleTableView:(UIBubbleTableView *)tableView dataForRow:(NSInteger)row
{
    return [bubbleData objectAtIndex:row];
}

#pragma mark - Actions

- (IBAction)sayPressed:(id)sender
{
    bubbleTable.typingBubble = NSBubbleTypingTypeNobody;
    NSDate *date_Message = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *text_Message = textField.text;
    
    NSBubbleData *sayBubble = [NSBubbleData dataWithText:text_Message date:date_Message type:BubbleTypeMine];
    [bubbleData addObject:sayBubble];
    [bubbleTable reloadData];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    
    MessageDTO* messageDTO = [[MessageDTO alloc]initAvecIdMessage:idMessage
                                                      dateMessage: [date_Message description]
                                                        etContenu: text_Message];
    NSLog(@"date %@",[date_Message description]);
    
    
    int intEnregistre = 0;
    
    NSString* typeRequete = [messageDTO idMessage] != nil ? @"mise a jour ":@"création";
    
    NSString* typeRequeteAction = [messageDTO idMessage] != nil ? @"mis a jour " : @"crée(s)";
    
    
    intEnregistre = [[MessageFacade messageFacade]createMessage:messageDTO];
    idEnregistre = [NSString stringWithFormat:@"%d", intEnregistre];
    
    
    
    NSLog(@"Requete de %@ , %d enregistrement(s) %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
    
    if (intEnregistre > 0){
        NSLog(@"Requete de %@ reussie message, %d enregistrement(s) %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
        
        
        // enregistre  contact_chatroom_message
        
        
        self.contactsChatRoom = [[NSMutableArray alloc] init];
        
        [self setContactsChatRoom:[[ContactChatRoomFacade  contactChatRoomFacade]
                                   getAllContacts:[self idChatRoom]]];
        NSLog(@"antes for");
        
        for(int i=0 ; i < [contactsChatRoom count]; i++) {
            
            NSLog(@"entra for");
            UtilisateurDTO *contactDTO = [contactsChatRoom objectAtIndex:i];
            
            UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:idUtilisateur];
            ChatRoomDTO *chatRoomDTO = [[ChatRoomFacade chatRoomFacade]readChatRoom:idChatRoom];
            MessageDTO *messageDTO = [[MessageFacade messageFacade]readMessage:idEnregistre];
            
                
                                                         
            ContactChatRoomMessageDTO* contactChatRoomMessageDTO = [[ContactChatRoomMessageDTO alloc]initAvecUtilisateur:utilisateurDTO
                    utilisateurContact: contactDTO
                              chatRoom: chatRoomDTO
                        etMessage : messageDTO];
            
        
        if([contactChatRoomMessageDTO utilisateur] != nil
           && [contactChatRoomMessageDTO chatRoom] != nil
           && [contactChatRoomMessageDTO utilisateurContact] != nil )
        {
            NSLog(@"entra if");
            int intEnregistre2 = 0;
            intEnregistre2 = [[ContactChatRoomMessageFacade contactChatRoomMessageFacade] createContactChatRoomMessage:contactChatRoomMessageDTO];
            if (intEnregistre2 == 1) {
                NSLog(@"Requete reussie");
                
            }
            else {
                NSLog(@"Impossible d'exécuter la requête");
            }
        }
        else {
            NSLog(@"Impossible d'exécuter la requête sont nils");
        }
    }

        
    }
    else if (idEnregistre !=0){
        NSLog(@"Requete de %@ reussie, %d enregistre  %@\n\n",typeRequete,intEnregistre,typeRequeteAction);
        
    }
    else {
        NSLog(@"Impossible d'exécuter la requêtede %@ \n\n",typeRequete);
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

-(IBAction)AnnulerModifierTchat:(UIStoryboardSegue*) segue{
    
}


@end
