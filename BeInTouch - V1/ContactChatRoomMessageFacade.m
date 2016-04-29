//
//  ContactChatRoomMessageFacade.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomMessageFacade.h"
#import "ContactChatRoomFacade.h"
#import "UtilisateurFacade.h"
#import "ChatRoomFacade.h"
#import "ContactFacade.h"
#import "MessageFacade.h"

static ContactChatRoomMessageFacade* contactChatRoomMessageFacade = nil;

@implementation ContactChatRoomMessageFacade

+ (void)initialize {
    contactChatRoomMessageFacade = [[ContactChatRoomMessageFacade alloc] init];
}

- (instancetype)init {
    if(contactChatRoomMessageFacade == nil) {
        contactChatRoomMessageFacade = [super init];
    }
    return contactChatRoomMessageFacade;
}

#pragma mark - Méthodes métier
+ (ContactChatRoomMessageFacade*)contactChatRoomMessageFacade {
    return contactChatRoomMessageFacade;
}

- (int)createContactChatRoomMessage:(ContactChatRoomMessageDTO *)contactChatRoomMessageDTO
{
    
    UtilisateurDTO* utilisateurActif =[[UtilisateurDTO alloc] init];
    utilisateurActif =[contactChatRoomMessageDTO utilisateur];
    UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
    utilisateurContactActif =[contactChatRoomMessageDTO utilisateurContact];
    ChatRoomDTO* chatRoomActif =[[ChatRoomDTO alloc] init];
    chatRoomActif =[contactChatRoomMessageDTO chatRoom];
    MessageDTO* messageActif =[[MessageDTO alloc] init];
    messageActif =[contactChatRoomMessageDTO message];
    
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createContactChatRoomMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_utilisateur_contact=%@&id_chatroom=%@&id_message=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[utilisateurContactActif idUtilisateur],[chatRoomActif idChatRoom],[messageActif idMessage]];
    
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200 && donnees != nil) {
        NSLog(@"test 200");
        NSDictionary* resultatJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        nombreEnregistrements = (int) [resultatJSON[@"nombreEnregistrements"] integerValue];
    } else if([response statusCode] != 200 &&      donnees != nil) {
        NSDictionary* erreurJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        NSString* codeErreur = erreurJSON[@"codeErreur"];
        NSString* messageErreur = erreurJSON[@"messageErreur"];
        
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ -> [Code d'erreur MySQL %@] %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, codeErreur, messageErreur);
    } else if(error != nil) {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@ : %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, [error localizedDescription]);
    } else {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete);
    }
    return nombreEnregistrements;
}

-(ContactChatRoomMessageDTO *)readContactChatRoomMessageAvecIdUtilisateur:(NSString *)idUtilisateur idUtilisateurContact:(NSString *)idUtilisateurContact idChatRoom:(NSString *)idChatRoom etIdMessage:(NSString *)idMessage
{
    ContactChatRoomMessageDTO* contactChatRoomMessageDTO = nil;
    
        return contactChatRoomMessageDTO;
}

- (int)updateContactChatRoomMessage:(ContactChatRoomMessageDTO *)contactChatRoomMessageDTO
{
        return 0;
}

- (int)deleteContactChatRoomMessage:(ContactChatRoomMessageDTO *)contactChatRoomMessageDTO
{
    return 0;
}
- (NSMutableArray*)getAllContactChatRoomMessages:(NSString *)idUtilisateur etChatRoom:(NSString *)idChatRoom
{
    NSLog(@"getAll ContactChatRoomMessageFacade");
    
    
    NSMutableArray* contactChatRoomMessages = [[NSMutableArray alloc] init];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=getAllContactChatRoomMessages&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_chatroom=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idChatRoom];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if([response statusCode] == 200 && donnees != nil) {
        NSLog(@"== 200");
        NSArray* resultats = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* contactChatRoomMessageJSON in resultats) {
            
            ContactChatRoomMessageDTO* contactChatRoomMessageDTO = [[ContactChatRoomMessageDTO alloc] init];
            
            UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur:
                                              contactChatRoomMessageJSON[@"id_utilisateur"]];
            
            [contactChatRoomMessageDTO setUtilisateur:utilisateurDTO];
            
            ChatRoomDTO *chatRoomDTO = [[ChatRoomFacade chatRoomFacade]readChatRoom:
                                        contactChatRoomMessageJSON[@"id_chatroom"]];
            [contactChatRoomMessageDTO setChatRoom:chatRoomDTO];
            
            
            UtilisateurDTO *contact= [[UtilisateurFacade utilisateurFacade]readUtilisateur: contactChatRoomMessageJSON[@"id_utilisateur_contact"]];
            
            [contactChatRoomMessageDTO setUtilisateurContact:contact];
            
            MessageDTO *messageDTO = [[MessageFacade messageFacade]readMessage:
                                      contactChatRoomMessageJSON[@"id_message"]];
            
            [contactChatRoomMessageDTO setMessage:messageDTO];
            
            
            
            [contactChatRoomMessages addObject:contactChatRoomMessageDTO];
        }
    } else if([response statusCode] != 200 &&      donnees != nil) {
        
        NSDictionary* erreurJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        NSString* codeErreur = erreurJSON[@"codeErreur"];
        NSString* messageErreur = erreurJSON[@"messageErreur"];
        
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ -> [Code d'erreur MySQL %@] %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, codeErreur, messageErreur);
    } else if(error != nil) {
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ : %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, [error localizedDescription]);
    } else {
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete);
    }
    return contactChatRoomMessages;
}
@end