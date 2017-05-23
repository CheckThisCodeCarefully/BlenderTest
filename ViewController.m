//
//  ViewController.m
//  BlenderTest
//
//  Created by Eva Puskas on 2017. 05. 15..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    [self.myTableView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView  *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0;
}

- (UITableViewCell *)tableView:(UITableView  *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Test before changes
    /*
     
     static NSString *CellIdentifier = @"Cell"; // change 1 - not the same with storyboard prototype cell
     UITableViewCell *cell = (UITableViewCell *)[self.myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
     float screenW1 = [UIScreen mainScreen].bounds.size.width;
     UIImage *cellImage;
     UIButton *cellImageView;
     UILabel *firstLabel, *secondLabel;
     NSString *pathCircle;
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenW1/14.15+110, 20, screenW1-2*(screenW1/14.15), 22)];
     secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenW1/14.15+110, 48, screenW1-2*(screenW1/14.15), 23)];
     pathCircle = [[NSBundle mainBundle] pathForResource:@"play_icon" ofType:@"png"];
     cellImage = [[UIImage alloc] initWithContentsOfFile:pathCircle];
     cellImageView = [[UIButton alloc]initWithFrame:CGRectMake(screenW1/14.15, 19, 92, 92)];
     [cellImageView setBackgroundImage:cellImage forState:UIControlStateNormal];
     [cellImageView addTarget:self action:@selector(unwindBack) forControlEvents:UIControlEventTouchUpInside];
     firstLabel.font = [UIFont fontWithName:@"OpenSans-Light" size:16];
     firstLabel.textColor = [UIColor blackColor];
     firstLabel.backgroundColor=[UIColor whiteColor];
     firstLabel.textAlignment = NSTextAlignmentLeft;
     secondLabel.font = [UIFont fontWithName:@"OpenSans" size:17];
     secondLabel.textColor = [UIColor blackColor];
     secondLabel.backgroundColor=[UIColor whiteColor];
     [cell.contentView addSubview:firstLabel];
     [cell.contentView addSubview:secondLabel];
     [cell.contentView addSubview:cellImageView];
     firstLabel.text = @"firstLabel";
     secondLabel.text = @"secondLabel";
     return cell;
     */
    
    //after changes
    static NSString *CellIdentifier = @"Cella"; // change 1 - not the same with storyboard prototype cell
    UITableViewCell *cell = (UITableViewCell *)[self.myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    float screenW1 = [UIScreen mainScreen].bounds.size.width;
    UIImage *cellImage;
    UIButton *cellImageView;
    UILabel *firstLabel, *secondLabel;
    NSString *pathCircle;
    if(!cell) {// change 2 - use initWithStyle reuseIdentifier - drawing, create frames just here
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        firstLabel = [[UILabel alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15+110, 20, screenW1-2*(screenW1/14.15), 22))]; // change 3 - magenta pixels - blended layer use CGRectIntegral
        firstLabel.tag =6;// change 4 - use tags
        secondLabel = [[UILabel alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15+110, 48, screenW1-2*(screenW1/14.15), 23))];
        secondLabel.tag = 7;
        pathCircle = [[NSBundle mainBundle] pathForResource:@"play_icon_2" ofType:@"png"]; // change 5 - red blended layer -  use png with background
        cellImage = [[UIImage alloc] initWithContentsOfFile:pathCircle];
        cellImageView = [[UIButton alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15, 19, 91, 92))]; // change 6 - yellow missaligned images - log out frame sizes and check image size - should fit!
        [cellImageView setBackgroundImage:cellImage forState:UIControlStateNormal];
        cellImageView.tag=12;
        [cellImageView addTarget:self action:@selector(unwindBack) forControlEvents:UIControlEventTouchUpInside];
        firstLabel.font = [UIFont fontWithName:@"OpenSans-Light" size:16];
        firstLabel.textColor = [UIColor blackColor];
        firstLabel.backgroundColor=[UIColor whiteColor];
        firstLabel.textAlignment = NSTextAlignmentLeft;
        secondLabel.font = [UIFont fontWithName:@"OpenSans" size:17];
        secondLabel.textColor = [UIColor blackColor];
        secondLabel.backgroundColor=[UIColor whiteColor];
        [cell.contentView addSubview:firstLabel];
        [cell.contentView addSubview:secondLabel];
        [cell.contentView addSubview:cellImageView];
        cell.layer.shouldRasterize = YES; // change 7 - cell layer rasterize
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;

    }
    firstLabel = (UILabel *)[cell.contentView viewWithTag:6]; // change 8 - using viewWithTag for custom views in cell contentview
    secondLabel = (UILabel *)[cell.contentView viewWithTag:7];
    cellImageView= (UIButton *)[cell.contentView viewWithTag:12];
    firstLabel.text = @"firstLabel";
    secondLabel.text = @"secondLabel";
    return cell;

}
-(void)unwindBack{
    [self performSegueWithIdentifier:@"unwind" sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
