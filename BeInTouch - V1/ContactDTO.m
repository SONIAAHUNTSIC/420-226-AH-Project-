//
//  ContactDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactDTO.h"

@implementation ContactDTO

@synthesize utilisateur;
@synthesize utilisateurContact;


-(instancetype) initAvecUtilisateur:(UtilisateurDTO *)unUtilisateur etUtilisateurContact:(UtilisateurDTO *)unUtilisateurContact
{
    if (self = [super init]) {
        [self setUtilisateur:unUtilisateur];
        [self setUtilisateurContact:unUtilisateurContact];
    }
    return self;
}


@end
