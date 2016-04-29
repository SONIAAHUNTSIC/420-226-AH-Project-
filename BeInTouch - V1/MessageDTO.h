//
//  MessageDTO.h
//  BeInTouch - V1
//
//  Created by tamadje patrick on 12/04/2016.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageDTO : NSObject

@property (strong, nonatomic) NSString* idMessage;
@property (strong, nonatomic) NSString* dateMessage;
@property (strong, nonatomic) NSString* contenu;

-(instancetype) initAvecIdMessage: (NSString*) unIdMessage
                      dateMessage:(NSString*)unDateMessage
                        etContenu:(NSString*)unContenu;

@end
