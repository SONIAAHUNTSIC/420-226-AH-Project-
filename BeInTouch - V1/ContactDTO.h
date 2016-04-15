//
//  ContactDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilisateurDTO.h"

@interface ContactDTO : NSObject

@property (strong, nonatomic) UtilisateurDTO* idUtilisateur;
@property (strong, nonatomic) UtilisateurDTO* idUtilisateurContact;

-(instancetype) initAvecIdUtilisateur: (UtilisateurDTO*) unIdUtilisateur etUtilisateurContact:(UtilisateurDTO*)unIdUtilisateurContact;

@end
