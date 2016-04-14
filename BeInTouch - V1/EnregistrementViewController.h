//
//  EnregistrementViewController.h
//  BeInTouch
//
//  Created by Aliou GUEYE on 10.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnregistrementViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textPrenom;
@property (strong, nonatomic) IBOutlet UITextField *textNom;
@property (strong, nonatomic) IBOutlet UITextField *textSexe;
@property (strong, nonatomic) IBOutlet UITextField *textDateNaissance;
@property (strong, nonatomic) IBOutlet UITextField *textCourriel;
@property (strong, nonatomic) IBOutlet UITextField *textTelephone;


@property (nonatomic) NSString *idUtilisateur;

@end
