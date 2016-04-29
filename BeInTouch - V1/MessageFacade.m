//
//  MessageFacade.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 12/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "MessageFacade.h"

static MessageFacade* messageFacade = nil;

#pragma mark - Membres publics


@implementation MessageFacade

+ (void)initialize {
    messageFacade = [[MessageFacade alloc] init];
}

- (instancetype)init {
    if(messageFacade == nil) {
        messageFacade = [super init];
    }
    return messageFacade;
}

#pragma mark - Méthodes métier
+ (MessageFacade*)messageFacade {
    return messageFacade;
}

- (int)createMessage:(MessageDTO *)messageDTO
{
    NSLog(@"test message");
    int nombreEnregistrements = 0;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=createMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&date_message=%@&contenu=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, [messageDTO dateMessage], [messageDTO contenu]];
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

- (MessageDTO*)readMessage:(NSString *)idMessage
{
    MessageDTO* messageDTO = nil;
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@URL_SERVICE_WEB]];
    NSHTTPURLResponse* response = nil;
    NSError* error = nil;
    NSString* parametresRequete = [NSString stringWithFormat:@"methode=readMessage&serveur=%@&utilisateur=%@&motDePasse=%@&baseDeDonnees=%@&port=%@&id_message=%@", @SERVEUR, @UTILISATEUR, @MOT_DE_PASSE, @BASE_DE_DONNEES, @PORT, idMessage];
    NSData* donnees = nil;
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[parametresRequete dataUsingEncoding:NSUTF8StringEncoding]];
    donnees = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if([response statusCode] == 200
       && donnees != nil) {
        NSDictionary* messageJSON = [NSJSONSerialization JSONObjectWithData:donnees options:NSJSONReadingAllowFragments error:&error];
        
        messageDTO = [[MessageDTO alloc] initAvecIdMessage:messageJSON[@"id_message"] dateMessage:messageJSON[@"date_message"] etContenu:messageJSON[@"contenu"]];
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
    return messageDTO;
}
- (int)updateMessage:(MessageDTO *)messageDTO
{
    int nombreEnregistrements = 0;
        return nombreEnregistrements;
}

- (int)deleteMessage:(MessageDTO *)messageDTO
{
    int nombreEnregistrements = 0;
        return nombreEnregistrements;
}

- (NSMutableArray*)getAllMessages {
    NSMutableArray* messages = [[NSMutableArray alloc] init];
        return messages;
}

@end