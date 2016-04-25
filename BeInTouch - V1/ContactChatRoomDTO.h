//
//  ContactChatRoomDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UtilisateurDTO.h"
#import "ChatRoomDTO.h"


@interface ContactChatRoomDTO : NSObject

@property (strong,nonatomic) UtilisateurDTO* utilisateur;
@property (strong,nonatomic) ChatRoomDTO* chatRoom;
@property (strong,nonatomic) UtilisateurDTO* utilisateurContact;
@property (strong,nonatomic) NSString* swAdmin;
@property (strong,nonatomic) NSString* swCreateur;
@property (strong,nonatomic) NSString* dateDebut;
@property (strong,nonatomic) NSString* swActif;
@property (strong,nonatomic) NSString* dateDepart;



#pragma mark - Méthode d'initialisation

-(instancetype)initAvecUtilisateur:(UtilisateurDTO*)unUtilisateurDTO
                          chatRoom:(ChatRoomDTO*)unChatRoomDTO
                utilisateurContact:(UtilisateurDTO*)unUtilisateurContactDTO
                           swAdmin:(NSString*)unSwAdmin
                        swCreateur:(NSString*)unSwCreateur
                         dateDebut:(NSString*)unDateDebut
                           SwActif:(NSString*)unSwActif
                      etDateDepart:(NSString*)undateDepart;
@end

