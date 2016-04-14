//
//  MembreFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 13/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MembreDTO.h"

@interface MembreFacade : NSObject

+ (MembreFacade*) membreFacade;

/*-(int) createMembreAvecTchatroom:(TchatroomDTO*)tcharoom etUtilisateur:(UtilisateurDTO*)utilisateur;*/
-(int) createMembre:(MembreDTO*)membreDTO ;
/*-(MembreDTO*) readMembreAvecTchatroom:(TchatroomDTO*)tcharoom etUtilisateur:(UtilisateurDTO*)utilisateur;*/
- (MembreDTO*)readMembre:(NSString *)membre;
-(int) updateMembreAvecTchatroom:(TchatroomDTO*)tcharoom etUtilisateur:(UtilisateurDTO*)utilisateur;
-(int) deleteMembreAvecTchatroom:(TchatroomDTO*)tcharoom etUtilisateur:(UtilisateurDTO*)utilisateur;
-(NSMutableArray*)getAllMembres;

@end
