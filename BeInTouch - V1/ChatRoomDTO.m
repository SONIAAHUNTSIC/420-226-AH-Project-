//
//  ChatRoomDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ChatRoomDTO.h"

@implementation ChatRoomDTO

@synthesize idChatRoom;
@synthesize sujet;
@synthesize dateCreation;
@synthesize dateFermeture;

-(instancetype) initAvecIdChatRoom:(NSString *)unIdChatRoom sujet:(NSString *)unSujet dateCreation:(NSString *)unDateCreation etDateFermeture:(NSString *)unDateFermeture
{
    //initialisation de l'instance personne
    if (self = [super init]) {
        [self setIdChatRoom:unIdChatRoom];
        [self setSujet:unSujet];
        [self setDateCreation:unDateCreation];
        [self setDateFermeture:unDateFermeture];
    }
    return self;
}



@end
