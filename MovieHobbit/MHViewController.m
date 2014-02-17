//
//  MHViewController.m
//  MovieHobbit
//
//  Created by willsborKang on 14/2/17.
//  Copyright (c) 2014年 thinkermobile. All rights reserved.
//

#import "MHViewController.h"
#import "MHDataManager.h"
#import "MHMovieItemCell.h"
#import "MHGlobalVar.h"

@interface MHViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *moviesResultsController;
@property (weak, nonatomic) IBOutlet UITableView *displayTable;

@end

@implementation MHViewController

- (NSFetchedResultsController *) moviesResultsController
{
    if (_moviesResultsController) {
        return _moviesResultsController;
    }
    
    NSSortDescriptor *sortDate = [NSSortDescriptor sortDescriptorWithKey:@"sort" ascending:YES];
    
    _moviesResultsController
    = [[MHDataManager sharedInstance] createFetchResultsControllerWithEntityForName:@"MovieItem"
                                                                       andPredicate:nil
                                                                           andSorts:@[sortDate]
                                                                       andCacheName:nil];
    _moviesResultsController.delegate = self;
    
    NSError *error;
    if (![_moviesResultsController performFetch:&error]) {
        LOG_GENERAL(2, @"Fetch Error : %@", error);
        NSAssert(FALSE, @"Fetch Error : %@", error);
    }
    return _moviesResultsController;
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.displayTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.moviesResultsController.sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MHMovieItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieItemCell"];
    
    MovieItem *item = [self.moviesResultsController objectAtIndexPath:indexPath];
    
    cell.titleLabel.text = item.title;
    cell.ratingLabel.text = item.rating;
    cell.yearLabel.text = [item.year stringValue];
    
    [self loadImage:cell.postImageView from:item.poster placeholder:tmImageWithColor([UIColor darkGrayColor])];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[MHGlobalVar sharedInstance] apiMovieHobbitComplete:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
