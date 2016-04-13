//
//  UtilisateurDTO.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-11.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//
#import "UtilisateurDTO.h"
@implementation UtilisateurDTO

#pragma mark - Propiétes
@synthesize idUtilisateur;
@synthesize nom;
@synthesize prenom;
@synthesize sexe;
@synthesize dateCreation;
@synthesize dateNaissance;
@synthesize photo;
@synthesize courriel;
@synthesize telephone;
@synthesize adresse;


#pragma mark - Methode d'initialisation

-(instancetype)initAvecIdUtilisateur:(NSString *)unIdUtilisateur nom:(NSString *)unNom prenom:(NSString *)unPrenom sexe:(NSString *)unSexe   dateCreation:(NSString *)unDateCreation  dateNaissance:(NSString *)unDateNaissance photo:(NSString *)unPhoto courriel:(NSString *)unCourriel telephone:(NSString *)unTelephone etAdresse:(AdresseDTO *)unAdresse{
    if(self = [super init]) {
        [self setIdUtilisateur:unIdUtilisateur];
        [self setNom:unNom];
        [self setPrenom:unPrenom];
        [self setSexe:unSexe];
        [self setDateCreation:unDateCreation];
        [self setDateNaissance:unDateNaissance];
        [self setPhoto:unPhoto];
        [self setCourriel:unCourriel];
        [self setTelephone:unTelephone];
        [self setAdresse:unAdresse];
        
    }
    return self;
}
@end

