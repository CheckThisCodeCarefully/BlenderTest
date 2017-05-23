//
//  FirstViewController.m
//  BlenderTest
//
//  Created by Eva Puskas on 2017. 05. 23..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50.0, 100.0, 100.0)];
    [button setTitle:@"show Table" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(touchbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)touchbutton{
    [self performSegueWithIdentifier:@"showTable" sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)unwindfromTable:(UIStoryboardSegue *)segue{
    
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
