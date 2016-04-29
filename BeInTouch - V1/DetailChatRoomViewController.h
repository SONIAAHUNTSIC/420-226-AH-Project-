//
//  DetailChatRoomViewController.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBubbleTableViewDataSource.h"

@interface DetailChatRoomViewController : UIViewController <UIBubbleTableViewDataSource>

#pragma mark - Proprietés privées
@property (nonatomic) NSMutableArray* messages;
@property (nonatomic) NSMutableArray* contactsChatRoom;
@property (nonatomic) NSString *idUtilisateur;
@property (nonatomic) NSString *idChatRoom;
@property (nonatomic) NSString *idUtilisateurContact;
@property (nonatomic) NSString *idMessage;

@property (nonatomic) NSString *idEnregistre;
@end
