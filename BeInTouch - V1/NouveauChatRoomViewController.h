//
//  NouveauChatRoomViewController.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NouveauChatRoomViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textSujetChat;
@property (nonatomic) NSString *idUtilisateur;
@property (nonatomic) NSString *idChatRoom;

@end
