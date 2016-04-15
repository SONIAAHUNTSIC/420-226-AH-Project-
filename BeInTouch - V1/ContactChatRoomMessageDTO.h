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

@property (strong, nonatomic) UtilisateurDTO* idUtilisateur;
@property (strong, nonatomic) UtilisateurDTO* idUtilisateurContact;
@property (strong, nonatomic) ChatRoomDTO* idChatRoom;
@property (strong, nonatomic) MessageDTO* idMessage;

-(instancetype) initAvecIdUtilisateur: (UtilisateurDTO*) unIdUtilisateur utilisateurContact:(UtilisateurDTO*)unIdUtilisateurContact chatRoom:(ChatRoomDTO*)unIdChatRoom etMessage:(MessageDTO*)unIdMessage;


@end
