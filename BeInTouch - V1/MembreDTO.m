//
//  MembreDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 13/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "MembreDTO.h"
#import "TchatroomDTO.h"

@implementation MembreDTO

@synthesize utilisateur;
@synthesize tchatroom;
@synthesize dateDepuis;
@synthesize dateDepart;
@synthesize swAdministrateur;
@synthesize swCreateur;
@synthesize swActif;

#pragma mark - Methode d'initialisation

-(instancetype)initAvecUtilisateur:(UtilisateurDTO *)unUtilisateur tchatroom:(TchatroomDTO *)unTchatroomDTO dateDepuis:(NSString *)unDateDepuis dateDepart:(NSString *)undateDepart swAdministrateur:(NSString*)unSwAdministrateur swCreateur:(NSString*)unSwCreateur etSwActif:(NSString*)unSwActif
{
    if(self = [super init]) {
        [self setUtilisateur:unUtilisateur];
        [self setTchatroom:unTchatroomDTO];
        [self setDateDepuis:unDateDepuis];
        [self setDateDepart:undateDepart];
        [self setSwAdministrateur:unSwAdministrateur];
        [self setSwCreateur:unSwCreateur];
        [self setSwActif:unSwActif];
        
    }
    return self;
}


@end
