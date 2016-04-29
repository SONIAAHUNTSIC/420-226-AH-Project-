//
//  ContactChatRoomFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactChatRoomDTO.h"

@interface ContactChatRoomFacade : NSObject

+ (ContactChatRoomFacade*) contactChatRoomFacade;

-(int) createContactChatRoom:(ContactChatRoomDTO*) contactChatRoomDTO ;
- (ContactChatRoomDTO*)readContactChatRoomAvecIdUtilisateur:(NSString*) idUtilisateur chatRoom:(NSString*)idChatRoom etIdUtilisateurContact:(NSString*) idUtilisateurContact;
-(int) updateContactChatRoom:(ContactChatRoomDTO*) contactChatRoomDTO ;
-(int) deleteContactChatRoom:(ContactChatRoomDTO*) contactChatRoomDTO ;
-(NSMutableArray*)getAllContactChatRooms:(NSString *) idUtilisateur;
-(NSMutableArray*)getAllContacts:(NSString *) idUtilisateur
                  etChatRoom : (NSString*) idChatRoom;


@end
