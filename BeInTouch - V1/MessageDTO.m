//
//  MessageDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 12/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "MessageDTO.h"

@implementation MessageDTO
@synthesize idMessage;
@synthesize dateMessage;
@synthesize contenu;

-(instancetype) initAvecIdMessage: (NSString*) unIdMessage dateMessage:(NSString*)unDateMessage etContenu:(NSString*)unContenu
{
    //initialisation de l'instance personne
    if (self = [super init]) {
        [self setIdMessage:unIdMessage];
        [self setDateMessage:unDateMessage];
        [self setContenu:unContenu];
    }
    return self;
}


@end
