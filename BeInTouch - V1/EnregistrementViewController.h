//
//  EnregistrementViewController.h
//  BeInTouch
//
//  Created by Aliou GUEYE on 10.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdresseDTO.h"

@interface EnregistrementViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textNom;
@property (strong, nonatomic) IBOutlet UITextField *textPrenom;
@property (strong, nonatomic) IBOutlet UITextField *textSexe;
@property (strong, nonatomic) IBOutlet UITextField *textDateNaissance;
@property (strong, nonatomic) IBOutlet UITextField *textCourriel;
@property (strong, nonatomic) IBOutlet UITextField *textTelephone;
@property (strong, nonatomic) IBOutlet UITextField *textRue;
@property (strong, nonatomic) IBOutlet UITextField *textAppartement;
@property (strong, nonatomic) IBOutlet UITextField *textCodePostal;
@property (strong, nonatomic) IBOutlet UITextField *textVille;
@property (strong, nonatomic) IBOutlet UITextField *textProvince;
@property (strong, nonatomic) IBOutlet UITextField *textPays;

@property (nonatomic) NSString *idUtilisateur;
@property (nonatomic) NSString *idAdresse;
@property (nonatomic) AdresseDTO *adresseEnregistre;



@end
