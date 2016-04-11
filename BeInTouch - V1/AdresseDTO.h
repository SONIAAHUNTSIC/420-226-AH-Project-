//
//  AdresseDTO.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-09.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdresseDTO : NSObject

@property (strong,nonatomic) NSString* idAdresse;
@property (strong,nonatomic) NSString* rue;
@property (strong,nonatomic) NSString* appartement;
@property (strong,nonatomic) NSString* codePostal;
@property (strong,nonatomic) NSString* ville;
@property (strong,nonatomic) NSString* province;
@property (strong,nonatomic) NSString* pays;

#pragma mark - Méthode d'initialisation

-(instancetype)initAvecIdAdresse:(NSString*)unIdAdresse rue:(NSString*)unRue appartement:(NSString*)unAppartement codePostal:(NSString*)unCodePostal ville:(NSString*)unVille province:(NSString*)unProvince etPays:(NSString*)unPays;

@end
