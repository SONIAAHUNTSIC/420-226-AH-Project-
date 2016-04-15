//
//  ChatRoomFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatRoomDTO.h"

@interface ChatRoomFacade : NSObject

+ (ChatRoomFacade*) chatRoomFacade;

-(int) createChatRoom:(ChatRoomDTO*) chatRoomDTO;
-(ChatRoomDTO*) readChatRoom:(NSString*) idChatRoom;
-(int) updateChatRoom:(ChatRoomDTO*) chatRoomDTO;
-(int) deleteChatRoom:(ChatRoomDTO*) chatRoomDTO;
-(NSMutableArray*)getAllChatRooms;


@end
