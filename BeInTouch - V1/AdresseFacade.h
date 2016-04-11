//
//  AdresseFacade.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-09.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdresseDTO.h"
@interface AdresseFacade : NSObject
#pragma mark - Methodes métier

+ (AdresseFacade*)adresseFacade;
-(int)createAdresse:(AdresseDTO*)adresseDTO;
-(AdresseDTO*)readAdresse:(NSString*)idAdresse;
-(int)updateAdresse:(AdresseDTO*)adresseDTO;
-(int)deleteAdresse:(AdresseDTO*)adresseDTO;
-(NSMutableArray*)getAllAdresses;

@end
