//
//  CollectionViewController.h
//  InstaKiloNew
//
//  Created by Tye Blackie on 2017-08-09.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSArray *categoryArray;
@property (nonatomic, strong) NSArray *locationArray;
@property (nonatomic, strong) NSDictionary *imageSubjectDictionary;
@property (nonatomic, strong) NSDictionary *imageLocationDictionary;
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subjectLocation;

@end
