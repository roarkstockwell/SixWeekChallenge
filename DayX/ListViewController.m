//
//  ListViewController.m
//  DayX
//
//  Created by Roark on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "EntryController.h"
#import <Parse/Parse.h>

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *shuffledArray;



@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.shuffledArray = [[NSMutableArray alloc]initWithArray:[EntryController sharedInstance].entries];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
- (IBAction)randomizeTapped:(id)sender {

        NSUInteger count = [self.shuffledArray count];
        for (NSUInteger i = 0; i < count - 1; ++i) {
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
            [self.shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
        }
    [self.tableView reloadData];
    NSLog(@"%@", self.shuffledArray);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *viewController = segue.destinationViewController;
        
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        viewController.entry = entry;
    }
}

#pragma mark - TableView Data Source Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger playerIndex = indexPath.section * 2 + indexPath.row;
    
    
    Entry *entry = self.shuffledArray[playerIndex];  //[EntryController sharedInstance].entries[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = entry.title;
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [[EntryController sharedInstance] removeEntry:[EntryController sharedInstance].entries[indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [EntryController sharedInstance].entries.count / 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  20;
    
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *he
//}











































@end
