//
//  AppDelegate.h
//  BlenderTest
//
//  Created by Eva Puskas on 2017. 05. 15..
//  Copyright © 2017. Pepzen Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

