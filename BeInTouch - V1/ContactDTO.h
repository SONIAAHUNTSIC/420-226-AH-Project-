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

@property (strong, nonatomic) UtilisateurDTO* utilisateur;
@property (strong, nonatomic) UtilisateurDTO* utilisateurContact;

-(instancetype) initAvecUtilisateur: (UtilisateurDTO*) unUtilisateur etUtilisateurContact:(UtilisateurDTO*)unUtilisateurContact;

@end
