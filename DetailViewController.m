//
//  DetailViewController.m
//  DayX
//
//  Created by Roark on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateWithEntry:self.entry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.textField.text;
//        self.entry.bodyText = self.bodyTextView.text;
//        self.entry.saveDate = [NSDate date];
    } else {
        self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.textField.text];
//        self.entry.bodyText = self.bodyTextView.text;
//        self.entry.saveDate = [NSDate date];
        

    }
    
    [[EntryController sharedInstance] save];
}

- (void)updateWithEntry:(Entry *)entry {
    if (entry) {
        self.textField.text = entry.title;
    }
//    self.bodyTextView.text = entry.bodyText;
}


#pragma mark - TextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}








/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
