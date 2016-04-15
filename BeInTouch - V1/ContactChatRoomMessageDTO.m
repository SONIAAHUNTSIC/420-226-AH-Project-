//
//  ContactChatRoomMessageDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomMessageDTO.h"

@implementation ContactChatRoomMessageDTO

@synthesize idUtilisateur;
@synthesize idUtilisateurContact;
@synthesize idChatRoom;
@synthesize idMessage;


-(instancetype) initAvecIdUtilisateur:(UtilisateurDTO *)unIdUtilisateur utilisateurContact:(UtilisateurDTO *)unIdUtilisateurContact chatRoom:(ChatRoomDTO *)unIdChatRoom etMessage:(MessageDTO *)unIdMessage
{
    if (self = [super init]) {
        [self setIdUtilisateur:unIdUtilisateur];
        [self setIdUtilisateurContact:unIdUtilisateurContact];
        [self setIdChatRoom:unIdChatRoom];
        [self setIdMessage:unIdMessage];
    }
    return self;
}


@end
