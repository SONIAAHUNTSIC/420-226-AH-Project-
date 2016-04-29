//
//  ChatRoomTableViewController.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatRoomTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>

#pragma mark - Proprietés privées
@property (strong,nonatomic) NSMutableArray* chatRooms;
@property (strong,nonatomic) NSMutableArray* contactChatRooms;
@property (strong,nonatomic) NSString *idUtilisateur;
@property (strong,nonatomic) NSString *idChatRoom;
@property (strong,nonatomic) NSString *sujet;



#pragma mark - Méthodes privées
- (void)chargerDonnees;



@end
