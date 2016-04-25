//
//  ContactFacade.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 14/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactDTO.h"

@interface ContactFacade : NSObject

+ (ContactFacade*) contactFacade;

-(int) createContact:(ContactDTO*) contactDTO;
-(ContactDTO*) readContact:(NSString*) idUtilisateur;
-(int) updateContact:(ContactDTO*) contactDTO;
-(int) deleteContact:(ContactDTO*) contactDTO;
-(NSMutableArray*)getAllContacts:(NSString *) idUtilisateur;


@end
