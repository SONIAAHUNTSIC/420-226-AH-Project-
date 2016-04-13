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

@property (strong,nonatomic) TchatroomDTO* idTchatroom;
@property (strong,nonatomic) UtilisateurDTO* idUtilisateur;
@property (strong,nonatomic) NSString* dateDepuis;
@property (strong,nonatomic) NSString* dateDepart;
@property (strong,nonatomic) NSString* swAdministrateur;
@property (strong,nonatomic) NSString* swCreateur;
@property (strong,nonatomic) NSString* swActif;


#pragma mark - Méthode d'initialisation

-(instancetype)initAvecUtilisateur:(UtilisateurDTO*)unUtilisateurDTO tchatroom:(TchatroomDTO*)unTchatroomDTO dateDepuis:(NSString*)unDateDepuis dateDepart:(NSString*)undateDepart swAdministrateur:(BOOL)unSwAdministrateur swCreateur:(BOOL)unSwCreateur etSwActif:(BOOL)unSwActif;
@end
