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

@property (strong, nonatomic) UtilisateurDTO* utilisateurActif;
@property (strong, nonatomic) UtilisateurDTO* utilisateurContact;

-(instancetype) initAvecUtilisateurActif: (UtilisateurDTO*)unUtilisateurActif etUtilisateurContact:(UtilisateurDTO*)unUtilisateurContact;

@end
