//
//  AjouterAmisViewController.h
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AjouterAmisViewController : UIViewController <UITextFieldDelegate>

// txtId  - Contact pour avoir relation avec idUtilisateur
@property (strong, nonatomic) IBOutlet UITextField *txtId;
@property (nonatomic) NSString *idUtilisateur;
@property (nonatomic) NSString *idContact;
- (IBAction)btnAjouter:(id)sender;


@property (nonatomic) NSString * aux_nom;
@property (nonatomic) NSString * aux_prenom;
@property (nonatomic) NSString * aux_sexe;
@property (nonatomic) NSString * aux_dateNaissance;
@property (nonatomic) NSString * aux_courriel;
@property (nonatomic) NSString * telephone;



@end
