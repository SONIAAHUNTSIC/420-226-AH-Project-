//
//  ContactDTO.m
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "ContactDTO.h"

@implementation ContactDTO

@synthesize utilisateurActif;
@synthesize utilisateurContact;


-(instancetype) initAvecUtilisateurActif:(UtilisateurDTO *)unUtilisateurActif etUtilisateurContact:(UtilisateurDTO *)unUtilisateurContact
{
    if (self = [super init]) {
        [self setUtilisateurActif:unUtilisateurActif];
        [self setUtilisateurContact:unUtilisateurContact];
    }
    return self;
}


@end
