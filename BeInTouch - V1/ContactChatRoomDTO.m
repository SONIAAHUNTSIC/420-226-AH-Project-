//
//  ContactChatRoomDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomDTO.h"
#import "ChatRoomDTO.h"

@implementation ContactChatRoomDTO

@synthesize utilisateur;
@synthesize chatRoom;
@synthesize utilisateurContact;
@synthesize swAdministrateur;
@synthesize swCreateur;
@synthesize dateDebut;
@synthesize swActif;
@synthesize dateDepart;



#pragma mark - Methode d'initialisation

-(instancetype)initAvecUtilisateur:(UtilisateurDTO *)unUtilisateurDTO chatRoom:(ChatRoomDTO *)unChatRoomDTO utilisateurContact:(UtilisateurDTO *)unUtilisateurContactDTO swAdministrateur:(NSString *)unSwAdministrateur swCreateur:(NSString *)unSwCreateur dateDebut:(NSString *)unDateDebut SwActif:(NSString *)unSwActif etDateDepart:(NSString *)undateDepart
{
    if(self = [super init]) {
        [self setUtilisateur:unUtilisateurDTO];
        [self setChatRoom:unChatRoomDTO];
        [self setUtilisateurContact:unUtilisateurContactDTO];
        [self setSwAdministrateur:unSwAdministrateur];
        [self setSwCreateur:unSwCreateur];
        [self setDateDebut:unDateDebut];
        [self setSwActif:unSwActif];
        [self setDateDepart:undateDepart];
        
    }
    return self;
}


@end

