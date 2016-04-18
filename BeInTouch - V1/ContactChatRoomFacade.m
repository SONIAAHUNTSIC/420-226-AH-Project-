//
//  ContactChatRoomFacade.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomFacade.h"

static ContactChatRoomFacade* contactChatRoomFacade = nil;

@implementation ContactChatRoomFacade

+ (void)initialize {
    contactChatRoomFacade = [[ContactChatRoomFacade alloc] init];
}

- (instancetype)init {
    if(contactChatRoomFacade == nil) {
        contactChatRoomFacade = [super init];
    }
    return contactChatRoomFacade;
}

#pragma mark - Méthodes métier
+ (ContactChatRoomFacade*)contactChatRoomFacade {
    return contactChatRoomFacade;
}

- (int)createContactChatRoom:(ContactChatRoomDTO *)contactChatRoomDTO
{
    NSLog(@"test ContactChatRoomFacade");
    ChatRoomDTO* chatRoomActif =[[ChatRoomDTO alloc] init];
    chatRoomActif =[contactChatRoomDTO chatRoom];
    UtilisateurDTO* utilisateurActif =[[UtilisateurDTO alloc] init];
    utilisateurActif =[contactChatRoomDTO utilisateur];
    UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
    utilisateurContactActif =[contactChatRoomDTO utilisateurContact];
    
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createContactChatRoom&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_chatroom=%@&id_utilisateur_contact=%@&sw_admin=%@&sw_createur=%@&date_debut=%@&sw_actif=%@&date_depart=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[chatRoomActif idChatRoom],[utilisateurContactActif idUtilisateur],[contactChatRoomDTO swAdministrateur],[contactChatRoomDTO swCreateur],[contactChatRoomDTO dateDebut],[contactChatRoomDTO swActif],[contactChatRoomDTO dateDepart]];
    
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

-(ContactChatRoomDTO *)readContactChatRoomAvecIdUtilisateur:(NSString *)idUtilisateur chatRoom:(NSString *)idChatRoom etIdUtilisateurContact:(NSString *)idUtilisateurContact
 {
     ContactChatRoomDTO* contactChatRoomDTO = nil;
 
     NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
     NSHTTPURLResponse* response = nil;
     NSError* error = nil;
     NSString* parametresRequete = [NSString stringWithFormat:@"methode=readContactChatRoom&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_chatroom=%@&id_utilisateur_contact=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idUtilisateur,idChatRoom, idUtilisateurContact];
     NSData* donnees = nil;
 
     [request setHTTPMethod:@"POST"];
     [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
     [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
     donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     if([response statusCode] == 200 && donnees != nil) {
         NSDictionary* contactChatRoomJSON = [NSJSONSerialization JSONObjectWithData:donnees options:    NSJSONReadingAllowFragments error:&error];
         
         NSDictionary* utilisateurJSON = contactChatRoomJSON[@"utilisateur"];
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
         
         NSDictionary* chatroomJSON = contactChatRoomJSON[@"tchatroom"];
         
         NSString* idChatRoom = chatroomJSON[@"idChatRoom"];
         NSString* sujet = chatroomJSON[@"sujet"];
         NSString* dateCreationChat = chatroomJSON[@"dateCreation"];
         NSString* dateFermeture = chatroomJSON[@"dateFermeture"];
         
         ChatRoomDTO * chatroom =[[ChatRoomDTO alloc] initAvecIdChatRoom:idChatRoom sujet:sujet dateCreation:dateCreationChat etDateFermeture:dateFermeture];
         
         NSDictionary* utilisateurContactJSON = contactChatRoomJSON[@"utilisateurContact"];
         
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
         
 
         contactChatRoomDTO = [[ContactChatRoomDTO alloc] initAvecUtilisateur:utilisateur chatRoom:chatroom utilisateurContact:utilisateurContact swAdministrateur:contactChatRoomJSON[@"swAdministrateur"] swCreateur:contactChatRoomJSON[@"swCreateur"] dateDebut:contactChatRoomJSON[@"dateDebut"] SwActif:contactChatRoomJSON[@"swActif"] etDateDepart:contactChatRoomJSON[@"datedepart"]];
         
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
     return contactChatRoomDTO;
    }
 
 - (int)updateContactChatRoom:(ContactChatRoomDTO *)contactChatRoomDTO
 {
     ChatRoomDTO* chatRoomActif =[[ChatRoomDTO alloc] init];
     chatRoomActif =[contactChatRoomDTO chatRoom];
     UtilisateurDTO* utilisateurActif =[[UtilisateurDTO alloc] init];
     utilisateurActif =[contactChatRoomDTO utilisateur];
     UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
     utilisateurContactActif =[contactChatRoomDTO utilisateurContact];

     int nombreEnregistrements = 0;
     NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:   @URL_SERVICE_WEB]];
     NSHTTPURLResponse* response = nil;
     NSError* error = nil;
     NSString* parametresRequete = [NSString stringWithFormat:@"methode=updateContactChatRoom&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_chatroom=%@&id_utilisateur_contact=%@&sw_admin=%@&sw_createur=%@&date_debut=%@&sw_actif=%@&date_depart=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[chatRoomActif idChatRoom],[utilisateurContactActif idUtilisateur],[contactChatRoomDTO swAdministrateur],[contactChatRoomDTO swCreateur],[contactChatRoomDTO dateDebut],[contactChatRoomDTO swActif],[contactChatRoomDTO dateDepart]];
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
 
 - (int)deleteContactChatRoom:(ContactChatRoomDTO *)contactChatRoomDTO
 {
     ChatRoomDTO* chatRoomActif =[[ChatRoomDTO alloc] init];
     chatRoomActif =[contactChatRoomDTO chatRoom];
     UtilisateurDTO* utilisateurActif =[[UtilisateurDTO alloc] init];
     utilisateurActif =[contactChatRoomDTO utilisateur];
     UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
     utilisateurContactActif =[contactChatRoomDTO utilisateurContact];

     int nombreEnregistrements = 0;
     NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
     NSHTTPURLResponse* response = nil;
     NSError* error = nil;
     NSString* parametresRequete = [NSString stringWithFormat:@"methode=deleteContactChatRoom&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_chatroom=%@&id_utilisateur_contact=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[chatRoomActif idChatRoom],[utilisateurContactActif idUtilisateur]];
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
 
 - (NSMutableArray*)getAllContactChatRooms
{
    NSLog(@"get all ");
    NSMutableArray* contactChatRooms = [[NSMutableArray alloc] init];
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
 
        for (NSDictionary* contactChatRoomJSON in resultats) {
            ContactChatRoomDTO* contactChatRoomDTO = [[ContactChatRoomDTO alloc] init];
            
            [contactChatRoomDTO setUtilisateur:contactChatRoomJSON[@"utilisateur"]];
            [contactChatRoomDTO setChatRoom:contactChatRoomJSON[@"chatRoom"]];
            [contactChatRoomDTO setUtilisateurContact:contactChatRoomJSON[@"utilisateurContact"]];
            
            [contactChatRoomDTO setSwAdministrateur:contactChatRoomJSON[@"swAdministrateur"]];
            [contactChatRoomDTO setSwCreateur:contactChatRoomJSON[@"swCreateur"]];
            [contactChatRoomDTO setDateDebut:contactChatRoomJSON[@"dateDebut"]];
            [contactChatRoomDTO setSwActif:contactChatRoomJSON[@"swActif"]];
            [contactChatRoomDTO setDateDepart:contactChatRoomJSON[@"dateDepart"]];
            
            [contactChatRooms addObject:contactChatRoomDTO];
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
    return contactChatRooms;
 }

@end