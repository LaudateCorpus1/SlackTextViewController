//
//  ChatRoomViewController.m
//  ChatRoom
//
//  Created by Ignacio Romero Z. on 8/15/14.
//  Copyright (c) 2014 Tiny Speck, Inc. All rights reserved.
//

#import "ChatRoomViewController.h"

#import <LoremIpsum/LoremIpsum.h>

@interface ChatRoomViewController ()
@end

@implementation ChatRoomViewController

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"SlackChatKit";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Type" style:UIBarButtonItemStylePlain target:self action:@selector(simulateTyping:)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Fill" style:UIBarButtonItemStyleDone target:self action:@selector(fillWithText:)];
    
    NSLog(@"self.textView : %@", self.textView);
    
    self.textView.placeholder = @"Message";
    self.textView.placeholderColor = [UIColor lightGrayColor];
    self.textView.layer.borderColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1.0].CGColor;
    self.textContainerView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
    
    [self.leftButton addTarget:self action:@selector(didTapLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(didTapRighttButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapLeftButton:(id)sender
{
    NSLog(@"%s",__FUNCTION__);
    
    
}

- (void)didTapRighttButton:(id)sender
{
    NSLog(@"%s",__FUNCTION__);
    
    self.textView.text = @"";
    [self dismissKeyboard];
}

- (void)simulateTyping:(id)sender
{
    [self.typeIndicatorView insertUsername:@"Ignacio"];
}

- (void)fillWithText:(id)sender
{
//    self.textView.text = [LoremIpsum sentencesWithNumber:3];
    
    [self.textView insertTextAtCursor:[LoremIpsum word]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld", (long)indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - View lifeterm

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


#pragma mark - View Auto-Rotation

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end