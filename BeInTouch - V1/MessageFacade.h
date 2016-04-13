//
//  MessageFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 12/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageDTO.h"

@interface MessageFacade : NSObject

+ (MessageFacade*) messageFacade;

-(int) createMessage:(MessageDTO*)messageDTO;
-(MessageDTO*) readMesaage:(NSString*)idMessage;
-(int) updateMessage:(MessageDTO*)messageDTO;
-(int) deleteMessage:(MessageDTO*)messageDTO;
-(NSMutableArray*)getAllMessages;

@end
