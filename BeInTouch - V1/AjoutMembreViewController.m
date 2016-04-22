//
//  AjoutMembreViewController.m
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import "AjoutMembreViewController.h"

@interface AjoutMembreViewController ()

@end

@implementation AjoutMembreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myData = [NSMutableArray array];
    [myData addObject:@"Sonia"];
    [myData addObject:@"Patrick"];
    [myData addObject:@"Aliou"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [myData count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    
    NSString *cellValue = [myData objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    return cell;
}

// Pour gérer le checkMark
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
     
     //deselect hightlight blue color
     [tableView deselectRowAtIndexPath:indexPath animated:YES];*/
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

@end
