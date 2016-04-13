//
//  TchatroomFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 13/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TchatroomDTO.h"

@interface TchatroomFacade : NSObject

+ (TchatroomFacade*) tchatroomFacade;

-(int) createTchatroom:(TchatroomDTO*)tchatroomDTO;
-(TchatroomDTO*) readTchatroom:(NSString*)idTchatroom;
-(int) updateTchatroom:(TchatroomDTO*)tchatroomDTO;
-(int) deleteTchatroom:(TchatroomDTO*)tchatroomDTO;
-(NSMutableArray*)getAllTchatrooms;

@end
