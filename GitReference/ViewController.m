//
//  ViewController.m
//  GitReference
//
//  Created by Egan Anderson on 4/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

static CGFloat topBorder = 20;
static CGFloat sideBorder = 15;
static CGFloat labelHeight = 20;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";



@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat scrollWidth = self.view.frame.size.width;
    CGFloat scrollHeight = self.view.frame.size.height-topBorder;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(sideBorder, topBorder, scrollWidth-sideBorder * 2, labelHeight)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
   
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topBorder, scrollWidth, scrollHeight)];
    [scroll addSubview:title];
    [self.view addSubview:scroll];
    
    CGFloat top = topBorder + labelHeight + sideBorder * 2;
    
    for (NSDictionary *dictionary in [self gitCommands]) {
        UILabel *commandLabel = [[UILabel alloc] initWithFrame:CGRectMake(sideBorder, top, scrollWidth-sideBorder * 2, labelHeight)];
        commandLabel.font = [UIFont boldSystemFontOfSize:17];
        commandLabel.text = dictionary[Command];
        [scroll addSubview:commandLabel];
        top += labelHeight + sideBorder;
        
        CGFloat referenceHeight = [self heightOfReferenceString:dictionary[Reference]];
       
        UILabel *referenceLabel = [[UILabel alloc] initWithFrame:CGRectMake(sideBorder, top, scrollWidth-sideBorder * 2, labelHeight)];
        referenceLabel.font = [UIFont boldSystemFontOfSize:15];
        referenceLabel.text = dictionary[Reference];
        [scroll addSubview:referenceLabel];
        top += referenceHeight + sideBorder * 2;
        
           }
    
    scroll.contentSize = CGSizeMake(scrollWidth, top);
    
    
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * sideBorder, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
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

@end
