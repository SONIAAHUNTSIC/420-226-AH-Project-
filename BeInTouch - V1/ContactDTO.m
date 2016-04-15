//
//  ContactDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactDTO.h"

@implementation ContactDTO

@synthesize idUtilisateur;
@synthesize idUtilisateurContact;


-(instancetype) initAvecIdUtilisateur:(UtilisateurDTO *)unIdUtilisateur etUtilisateurContact:(UtilisateurDTO *)unIdUtilisateurContact
{
    if (self = [super init]) {
        [self setIdUtilisateur:unIdUtilisateur];
        [self setIdUtilisateurContact:unIdUtilisateurContact];
    }
    return self;
}


@end
