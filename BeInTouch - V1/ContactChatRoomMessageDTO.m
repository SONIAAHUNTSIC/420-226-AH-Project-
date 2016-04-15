//
//  ContactChatRoomMessageDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactChatRoomMessageDTO.h"

@implementation ContactChatRoomMessageDTO

@synthesize utilisateur;
@synthesize utilisateurContact;
@synthesize chatRoom;
@synthesize message;


-(instancetype) initAvecUtilisateur:(UtilisateurDTO *)unUtilisateur utilisateurContact:(UtilisateurDTO *)unUtilisateurContact chatRoom:(ChatRoomDTO *)unChatRoom etMessage:(MessageDTO *)unMessage
{
    if (self = [super init]) {
        [self setUtilisateur:unUtilisateur];
        [self setUtilisateurContact:unUtilisateurContact];
        [self setChatRoom:unChatRoom];
        [self setMessage:unMessage];
    }
    return self;
}


@end
