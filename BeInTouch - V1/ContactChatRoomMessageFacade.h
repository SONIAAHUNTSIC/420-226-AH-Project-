//
//  ContactChatRoomMessageFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactChatRoomMessageDTO.h"

@interface ContactChatRoomMessageFacade : NSObject

+ (ContactChatRoomMessageFacade*) contactChatRoomMessageFacade;

-(int) createContactChatRoomMessage:(ContactChatRoomMessageDTO*) contactChatRoomMessageDTO;
-(ContactChatRoomMessageDTO*) readContactChatRoomMessageAvecIdUtilisateur:(NSString*) idUtilisateur idUtilisateurContact:(NSString*) idUtilisateurContact idChatRoom:(NSString*) idChatRoom etIdMessage:(NSString*) idMessage;
-(int) updateContactChatRoomMessage:(ContactChatRoomMessageDTO*) contactChatRoomMessageDTO;
-(int) deleteContactChatRoomMessage:(ContactChatRoomMessageDTO*) contactChatRoomMessageDTO;
-(NSMutableArray*)getAllContactChatRoomMessages;

@end
