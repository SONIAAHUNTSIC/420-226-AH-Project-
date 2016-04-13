//
//  UtilisateurDTO.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-11.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AdresseDTO.h"

@interface UtilisateurDTO : NSObject

@property (strong,nonatomic) NSString* idUtilisateur;
@property (strong,nonatomic) NSString* nom;
@property (strong,nonatomic) NSString* prenom;
@property (strong,nonatomic) NSString* sexe;
@property (strong,nonatomic) NSString* dateCreation;
@property (strong,nonatomic) NSString* dateNaissance;
@property (strong,nonatomic) NSString* photo;
@property (strong,nonatomic) NSString* courriel;
@property (strong,nonatomic) NSString* telephone;
@property (strong,nonatomic) AdresseDTO* adresse;

#pragma mark - Méthode d'initialisation

-(instancetype)initAvecIdUtilisateur:(NSString*)unIdUtilisateur nom:(NSString*)unNom prenom:(NSString*)unPrenom sexe:(NSString*)unSexe dateCreation:(NSString*)unDateCreation dateNaissance:(NSString*)unDateNaissance photo:(NSString*)unPhoto courriel:(NSString*)unCourriel telephone:(NSString*)unTelephone etAdresse:(AdresseDTO*)unAdresse;

@end