//
//  AdresseFacade.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-09.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "AdresseFacade.h"
#import "AdresseDTO.h"
static AdresseFacade* adresseFacade = nil;

#pragma mark - Membres publics

@implementation AdresseFacade

#pragma mark - Méthodes d'initialisation
+ (void)initialize {
    adresseFacade = [[AdresseFacade alloc] init];
}

- (instancetype)init {
    if(adresseFacade == nil) {
        adresseFacade = [super init];
    }
    return adresseFacade;
}

#pragma mark - Méthodes métier
+ (AdresseFacade*)adresseFacade {
    return adresseFacade;
}

- (int)createAdresse:(AdresseDTO*)adresseDTO {
    NSLog(@"test adresse");
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createAdresse&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&rue=%@&codePostal=%@&appartement=%@&ville=%@&province=%@&pays=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [adresseDTO rue], [adresseDTO appartement], [adresseDTO codePostal],[adresseDTO ville],[adresseDTO province],[adresseDTO pays]];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSLog(@"test 200");
        NSDictionary* resultatJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        nombreEnregistrements = (int) [resultatJSON[@"nombreEnregistrements"] integerValue];
    } else if([response statusCode] != 200
              &&      donnees != nil) {
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

- (AdresseDTO*)readAdresse:(NSString*)idAdresse {
    AdresseDTO* adresseDTO = nil;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=readAdresse&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idAdresse=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idAdresse];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSDictionary* adresseJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        
        adresseDTO = [[AdresseDTO alloc] initAvecIdAdresse:adresseJSON[@"idAdresse"] rue:adresseJSON[@"rue"] appartement:adresseJSON[@"appartement"] codePostal:adresseJSON[@"codePostal"]  ville:adresseJSON[@"ville"] province:adresseJSON[@"province"] etPays:adresseJSON[@"pays"]];
    } else if([response statusCode] != 200
              &&      donnees != nil) {
        NSDictionary* erreurJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        NSString* codeErreur = erreurJSON[@"codeErreur"];
        NSString* messageErreur = erreurJSON[@"messageErreur"];
        
        NSLog(@"[Code d'erreur HTTP %ld] Échec de la requête %@?%@ -> [Code d'erreur MySQL %@] %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, codeErreur, messageErreur);
    } else if(error != nil) {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@ : %@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete, [error localizedDescription]);
    } else {
        NSLog(@"[Code d'erreur %ld] Échec de la requête %@?%@", (long) [response statusCode], @URL_SERVICE_WEB, parametresRequete);
    }
    return adresseDTO;
}

- (int)updateAdresse:(AdresseDTO*)adresseDTO {
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=updateAdresse&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idAdresse=%@&prenom=%@&nom=%@&age=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [adresseDTO idAdresse], [adresseDTO rue], [adresseDTO appartement], [adresseDTO codePostal] , [adresseDTO ville], [adresseDTO province], [adresseDTO pays]];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSDictionary* resultatJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        nombreEnregistrements = (int) [resultatJSON[@"nombreEnregistrements"] integerValue];
    } else if([response statusCode] != 200
              &&      donnees != nil) {
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

- (int)deleteAdresse:(AdresseDTO*)adresseDTO {
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=deleteAdresse&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&idAdresse=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [adresseDTO idAdresse]];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSDictionary* resultatJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        nombreEnregistrements = (int) [resultatJSON[@"nombreEnregistrements"] integerValue];
    } else if([response statusCode] != 200
              &&      donnees != nil) {
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

- (NSMutableArray*)getAllAdresses {
    NSLog(@"get all ");
    NSMutableArray* adresses = [[NSMutableArray alloc] init];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=getAllAdresses&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if([response statusCode] == 200
       && donnees != nil) {
        NSLog(@"== 200");
        NSArray* resultats = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        for (NSDictionary* adresseJSON in resultats) {
            AdresseDTO* adresseDTO = [[AdresseDTO alloc] init];
            
            [adresseDTO setIdAdresse:adresseJSON[@"idAdresse"]];
            [adresseDTO setRue:adresseJSON[@"rue"]];
            [adresseDTO setAppartement:adresseJSON[@"appartement"]];
            [adresseDTO setCodePostal:adresseJSON[@"codePostal"]];
            [adresseDTO setVille:adresseJSON[@"ville"]];
            [adresseDTO setProvince:adresseJSON[@"province"]];
            [adresseDTO setPays:adresseJSON[@"pays"]];
            [adresses addObject:adresseDTO];
        }
    } else if([response statusCode] != 200
              &&      donnees != nil) {
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
    return adresses;
}

@end