//
//  TchatroomDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 13/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "TchatroomDTO.h"

@implementation TchatroomDTO
@synthesize idTchatroom;
@synthesize sujet;
@synthesize dateCreation;
@synthesize dateFermeture;

-(instancetype) initAvecIdTchatroom:(NSString *)unIdTchatroom sujet:(NSString *)unSujet dateCreation:(NSString *)unDateCreation etDateFermeture:(NSString *)unDateFermeture
{
    //initialisation de l'instance personne
    if (self = [super init]) {
        [self setIdTchatroom:unIdTchatroom];
        [self setSujet:unSujet];
        [self setDateCreation:unDateCreation];
        [self setDateFermeture:unDateFermeture];
    }
    return self;
}


@end
