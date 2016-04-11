//
//  AdresseDTO.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-09.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "AdresseDTO.h"

@implementation AdresseDTO

#pragma mark - Propiétes
@synthesize idAdresse;
@synthesize rue;
@synthesize codePostal;
@synthesize appartement;
@synthesize ville;
@synthesize province;
@synthesize pays;
#pragma mark - Methode d'initialisation

-(instancetype)initAvecIdAdresse:(NSString *)unIdAdresse rue:(NSString *)unRue appartement:(NSString *)unAppartement codePostal:(NSString *)unCodePostal   ville:(NSString *)unVille  province:(NSString *)unProvince  etPays:(NSString *)unPays {
    if(self = [super init]) {
        [self setIdAdresse:unIdAdresse];
        [self setRue:unRue];
        [self setCodePostal:unCodePostal];
        [self setAppartement:unAppartement];
        [self setVille:unVille];
        [self setProvince:unProvince];
        [self setPays:unPays];
    }
    return self;
}
@end
