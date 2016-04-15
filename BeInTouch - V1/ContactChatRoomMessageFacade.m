//
//  ContactChatRoomMessageFacade.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomMessageFacade.h"

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
    NSLog(@"test ContactFacade");
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
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createContactChatRoomMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idUtilisateur=%@&idUtilisateurContact=%@&idChatRoom=%@&idMessage=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[utilisateurContactActif idUtilisateur],[chatRoomActif idChatRoom],[messageActif idMessage]];
    
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
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=readContactChatRoomMessageAvecIdUtilisateur&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idUtilisateur=%@&idUtilisateurContact=%@&idChatRoom=%@&idMessage=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idUtilisateur,idUtilisateurContact,idChatRoom,idMessage];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200 && donnees != nil) {
        NSDictionary* contactChatRoomMessageJSON = [NSJSONSerialization JSONObjectWithData:donnees options:    NSJSONReadingAllowFragments error:&error];
        
        NSDictionary* utilisateurJSON = contactChatRoomMessageJSON[@"utilisateur"];
        NSString* idUtilisateur = utilisateurJSON[@"idUtilisateur"];
        NSString* prenom = utilisateurJSON[@"prenom"];
        NSString* nom = utilisateurJSON[@"nom"];
        NSString* sexe = utilisateurJSON[@"sexe"];
        NSString* dateCreation = utilisateurJSON[@"dateCreation"];
        NSString* dateNaissance = utilisateurJSON[@"dateNaissance"];
        NSString* photo = utilisateurJSON[@"dateNaissance"];
        NSString* courriel = utilisateurJSON[@"courriel"];
        NSString* telephone = utilisateurJSON[@"telephone"];
        
        UtilisateurDTO* utilisateur =[[UtilisateurDTO alloc] initAvecIdUtilisateur:idUtilisateur prenom:prenom nom:nom sexe:sexe dateCreation:dateCreation dateNaissance:dateNaissance photo:photo courriel:courriel etTelephone:telephone];
        
        NSDictionary* utilisateurContactJSON = contactChatRoomMessageJSON[@"utilisateurContact"];
        
        NSString* idUtilisateurContact = utilisateurContactJSON[@"idUtilisateur"];
        NSString* prenomContact = utilisateurContactJSON[@"prenom"];
        NSString* nomContact = utilisateurContactJSON[@"nom"];
        NSString* sexeContact = utilisateurContactJSON[@"sexe"];
        NSString* dateCreationContact = utilisateurContactJSON[@"dateCreation"];
        NSString* dateNaissanceContact = utilisateurContactJSON[@"dateNaissance"];
        NSString* photoContact = utilisateurContactJSON[@"dateNaissance"];
        NSString* courrielContact = utilisateurContactJSON[@"courriel"];
        NSString* telephoneContact = utilisateurContactJSON[@"telephone"];
        
        UtilisateurDTO* utilisateurContact =[[UtilisateurDTO alloc] initAvecIdUtilisateur:idUtilisateurContact prenom:prenomContact nom:nomContact sexe:sexeContact dateCreation:dateCreationContact dateNaissance:dateNaissanceContact photo:photoContact courriel:courrielContact etTelephone:telephoneContact];
        
        NSDictionary* chatroomJSON = contactChatRoomMessageJSON[@"tchatroom"];
        
        NSString* idChatRoom = chatroomJSON[@"idChatRoom"];
        NSString* sujet = chatroomJSON[@"sujet"];
        NSString* dateCreationChat = chatroomJSON[@"dateCreation"];
        NSString* dateFermeture = chatroomJSON[@"dateFermeture"];
        
        ChatRoomDTO * chatroom =[[ChatRoomDTO alloc] initAvecIdChatRoom:idChatRoom sujet:sujet dateCreation:dateCreationChat etDateFermeture:dateFermeture];
        
        NSDictionary* messageJSON = contactChatRoomMessageJSON[@"tchatroom"];
        
        NSString* idMessage = messageJSON[@"idMessage"];
        NSString* dateMessage = messageJSON[@"dateMessage"];
        NSString* contenu = messageJSON[@"contenu"];
        
        
        MessageDTO * message =[[MessageDTO alloc] initAvecIdMessage:idMessage dateMessage:dateMessage etContenu:contenu];
        
        
        contactChatRoomMessageDTO = [[ContactChatRoomMessageDTO alloc] initAvecUtilisateur:utilisateur utilisateurContact:utilisateurContact chatRoom:chatroom etMessage:message];
        
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
    return contactChatRoomMessageDTO;
}

- (int)updateContactChatRoomMessage:(ContactChatRoomMessageDTO *)contactChatRoomMessageDTO
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
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:   @URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=updateContactChatRoomMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idUtilisateur=%@&idUtilisateurContact=%@&idChatRoom=%@&idMessage=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[utilisateurContactActif idUtilisateur],[chatRoomActif idChatRoom],[messageActif idMessage]];
   NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSDictionary* resultatJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        nombreEnregistrements = (int) [resultatJSON[@"nombreEnregistrements"] integerValue];
    } else if([response statusCode] != 200 &&      donnees != nil){
        NSDictionary* erreurJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        NSString* codeErreur = erreurJSON[@"codeErreur"];
        NSString* messageErreur = erreurJSON[@"messageErreur"];
        
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ -> [Code d'erreur MySQL %@] %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete,     codeErreur, messageErreur);
    } else if(error != nil) {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@ : %@", (long) [response  statusCode], @URL_SERVICE_WEB, parametresRequete, [error localizedDescription]);
    } else {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete);
    }
    return nombreEnregistrements;
}

- (int)deleteContactChatRoomMessage:(ContactChatRoomMessageDTO *)contactChatRoomMessageDTO
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
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=deleteContactChatRoomMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idUtilisateur=%@&idUtilisateurContact=%@&idChatRoom=%@&idMessage=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[utilisateurContactActif idUtilisateur],[chatRoomActif idChatRoom],[messageActif idMessage]];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200 && donnees != nil) {
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

- (NSMutableArray*)getAllContactChatRoomMessages
{
    NSLog(@"get all ");
    NSMutableArray* contactChatRoomMessages = [[NSMutableArray alloc] init];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=getAllContactChatRooms&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT];
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
            
            [contactChatRoomMessageDTO setUtilisateur:contactChatRoomMessageJSON[@"utilisateur"]];
            [contactChatRoomMessageDTO setUtilisateurContact:contactChatRoomMessageJSON[@"utilisateurContact"]];
            
            [contactChatRoomMessages addObject:contactChatRoomMessageDTO];
            [contactChatRoomMessageDTO setChatRoom:contactChatRoomMessageJSON[@"chatRoom"]];
            [contactChatRoomMessageDTO setMessage:contactChatRoomMessageJSON[@"message"]];
            
            [contactChatRoomMessages addObject:contactChatRoomMessageDTO];
        }
    } else if([response statusCode] != 200 &&      donnees != nil) {
        NSLog(@"test not 200");
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