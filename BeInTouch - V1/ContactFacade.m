//
//  ContactFacade.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactFacade.h"
#import "ContactDTO.h"
#import "UtilisateurFacade.h"

static ContactFacade* contactFacade = nil;

@implementation ContactFacade

+ (void)initialize {
    contactFacade = [[ContactFacade alloc] init];
}

- (instancetype)init {
    if(contactFacade == nil) {
        contactFacade = [super init];
    }
    return contactFacade;
}

#pragma mark - Méthodes métier
+ (ContactFacade*)contactFacade {
    return contactFacade;
}

- (int)createContact:(ContactDTO*)contactDTO
{
    NSLog(@"test ContactFacade");
    UtilisateurDTO* utilisateur =[[UtilisateurDTO alloc] init];
    utilisateur = [contactDTO utilisateurActif];
    UtilisateurDTO* utilisateurContact  = [[UtilisateurDTO alloc] init];
    utilisateurContact = [contactDTO utilisateurContact];
    

    
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createContact&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_utilisateur_contact=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateur idUtilisateur],[utilisateurContact idUtilisateur]];
    
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


-(ContactDTO *)readContact:(NSString *)idUtilisateur 
{
    ContactDTO* contactDTO = nil;
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=readContact&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idUtilisateur];
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
        
        
        contactDTO = [[ContactDTO alloc]initAvecUtilisateurActif:(UtilisateurDTO *)utilisateur
                                            etUtilisateurContact:(UtilisateurDTO *)utilisateurContact];
        
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
    return contactDTO;
}

- (int)updateContact:(ContactDTO *)contactDTO
{
    UtilisateurDTO* utilisateur =[[UtilisateurDTO alloc] init];
    utilisateur =[contactDTO utilisateurActif];
    UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
    utilisateurContactActif =[contactDTO utilisateurContact];

    
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:   @URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=updateContact&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_utilisateur_contact=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateur idUtilisateur],[utilisateurContactActif idUtilisateur]];
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

- (int)deleteContact:(ContactDTO *)contactDTO
{
    UtilisateurDTO* utilisateurActif =[[UtilisateurDTO alloc] init];
    utilisateurActif =[contactDTO utilisateurActif];
    UtilisateurDTO* utilisateurContactActif =[[UtilisateurDTO alloc] init];
    utilisateurContactActif =[contactDTO utilisateurContact];
    
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=deleteContactChatRoom&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@&id_utilisateur_contact=%@&", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [utilisateurActif idUtilisateur],[utilisateurContactActif idUtilisateur]];
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

- (NSMutableArray*)getAllContacts:(NSString *) idUtilisateur; 
{
    NSMutableArray* contacts = [[NSMutableArray alloc] init];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=getAllContacts&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_utilisateur=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT,idUtilisateur];
    
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if([response statusCode] == 200
       && donnees != nil) {
        NSLog(@"== 200");
        NSArray* resultats = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
      
        
        for (NSDictionary* contactJSON in resultats) {
            ContactDTO* contactDTO = [[ContactDTO alloc] init];
            
            UtilisateurDTO *utilisateurDTO = [[UtilisateurFacade utilisateurFacade]readUtilisateur: idUtilisateur];
            
            [contactDTO setUtilisateurActif:utilisateurDTO];
            
            UtilisateurDTO *contact= [[UtilisateurFacade utilisateurFacade]readUtilisateur: contactJSON[@"id_utilisateur_contact"]];
            
            
            [contactDTO setUtilisateurContact:contact];
            
        
            [contacts addObject:contact];
            
        }
    } else if([response statusCode] != 200
              &&      donnees != nil) {
        NSDictionary* erreurJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        NSString* codeErreur = erreurJSON[@"codeErreur"];
        NSString* messageErreur = erreurJSON[@"messageErreur"];
        
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ -> [Code d'erreur MySQL %@] %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, codeErreur, messageErreur);
    } else if(error != nil) {
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ : %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, [error localizedDescription]);
    } else {
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete);
    }
    return contacts;

}

@end