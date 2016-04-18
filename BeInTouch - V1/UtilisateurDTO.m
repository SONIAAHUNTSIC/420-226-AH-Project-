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
@synthesize prenom;
@synthesize nom;
@synthesize sexe;
@synthesize dateCreation;
@synthesize dateNaissance;
@synthesize photo;
@synthesize courriel;
@synthesize telephone;



#pragma mark - Methode d'initialisation

-(instancetype)initAvecIdUtilisateur:(NSString *)unIdUtilisateur
                              prenom:(NSString *)unPrenom
                                 nom:(NSString *)unNom
                                sexe:(NSString *)unSexe
                        dateCreation:(NSString *)unDateCreation
                       dateNaissance:(NSString *)unDateNaissance
                               photo:(NSString *)unPhoto
                            courriel:(NSString *)unCourriel
                         etTelephone:(NSString *)unTelephone{
    if(self = [super init]) {
        [self setIdUtilisateur:unIdUtilisateur];
        [self setPrenom:unPrenom];
        [self setNom:unNom];
        [self setSexe:unSexe];
        [self setDateCreation:unDateCreation];
        [self setDateNaissance:unDateNaissance];
        [self setPhoto:unPhoto];
        [self setCourriel:unCourriel];
        [self setTelephone:unTelephone];
        
        
    }
    return self;
}
@end

