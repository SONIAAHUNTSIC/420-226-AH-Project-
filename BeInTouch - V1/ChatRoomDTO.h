//
//  ChatRoomDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatRoomDTO : NSObject

@property (strong, nonatomic) NSString* idChatRoom;
@property (strong, nonatomic) NSString* sujet;
@property (strong, nonatomic) NSString* dateCreation;
@property (strong, nonatomic) NSString* dateFermeture;

-(instancetype) initAvecIdChatRoom: (NSString*) unIdChatRoom sujet:(NSString*)unSujet dateCreation:(NSString*)unDateCreation etDateFermeture:(NSString*)unDateFermeture;


@end
