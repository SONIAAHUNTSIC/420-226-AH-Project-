//
//  MembreDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 13/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilisateurDTO.h"
#import "TchatroomDTO.h"

@interface MembreDTO : NSObject

@property (strong,nonatomic) TchatroomDTO* tchatroom;
@property (strong,nonatomic) UtilisateurDTO* utilisateur;
@property (strong,nonatomic) NSString* dateDebut;
@property (strong,nonatomic) NSString* dateDepart;
@property (strong,nonatomic) NSString* swAdministrateur;
@property (strong,nonatomic) NSString* swCreateur;
@property (strong,nonatomic) NSString* swActif;


#pragma mark - Méthode d'initialisation

-(instancetype)initAvecUtilisateur:(UtilisateurDTO*)unUtilisateurDTO tchatroom:(TchatroomDTO*)unTchatroomDTO dateDebut:(NSString*)unDateDebut dateDepart:(NSString*)undateDepart swAdministrateur:(NSString*)unSwAdministrateur swCreateur:(NSString*)unSwCreateur etSwActif:(NSString*)unSwActif;
@end
