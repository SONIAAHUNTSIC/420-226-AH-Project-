//
//  ContactChatRoomMessageDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilisateurDTO.h"
#import "ChatRoomDTO.h"
#import "MessageDTO.h"

@interface ContactChatRoomMessageDTO : NSObject

@property (strong, nonatomic) UtilisateurDTO* utilisateur;
@property (strong, nonatomic) UtilisateurDTO* utilisateurContact;
@property (strong, nonatomic) ChatRoomDTO* chatRoom;
@property (strong, nonatomic) MessageDTO* message;

-(instancetype) initAvecUtilisateur: (UtilisateurDTO*) unUtilisateur utilisateurContact:(UtilisateurDTO*)unUtilisateurContact chatRoom:(ChatRoomDTO*)unChatRoom etMessage:(MessageDTO*)unMessage;


@end
