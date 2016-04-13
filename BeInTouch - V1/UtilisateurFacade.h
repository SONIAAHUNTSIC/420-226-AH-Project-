//
//  UtilisateurFacade.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-09.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UtilisateurDTO.h"

@interface UtilisateurFacade : NSObject
#pragma mark - Methodes métier

+ (UtilisateurFacade*)utilisateurFacade;
-(int)createUtilisateur:(UtilisateurDTO*)utilisateurDTO;
-(UtilisateurDTO*)readUtilisateur:(NSString*)idUtilisateur;
-(int)updateUtilisateur:(UtilisateurDTO*)utilisateurDTO;
-(int)deleteUtilisateur:(UtilisateurDTO*)utilisateurDTO;
-(NSMutableArray*)getAllUtilisateurs;

@end
