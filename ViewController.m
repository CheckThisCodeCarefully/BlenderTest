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
    static NSString *CellIdentifier = @"Cella";
    UITableViewCell *cell = (UITableViewCell *)[self.myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    float screenW1 = [UIScreen mainScreen].bounds.size.width;
    UIImage *cellImage;
    UIButton *cellImageView;
    UILabel *firstLabel, *secondLabel;
    NSString *pathCircle;
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        firstLabel = [[UILabel alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15+110, 20, screenW1-2*(screenW1/14.15), 22))];
        firstLabel.tag =6;
        secondLabel = [[UILabel alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15+110, 48, screenW1-2*(screenW1/14.15), 23))];
        secondLabel.tag = 7;
        @autoreleasepool {
            pathCircle = [[NSBundle mainBundle] pathForResource:@"play_icon_2" ofType:@"png"];
            cellImage = [[UIImage alloc] initWithContentsOfFile:pathCircle];
        }
        cellImageView = [[UIButton alloc]initWithFrame:CGRectIntegral(CGRectMake(screenW1/14.15, 19, 91, 92))];
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
        cell.layer.shouldRasterize = YES;
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;

    }
    firstLabel = (UILabel *)[cell.contentView viewWithTag:6];
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
