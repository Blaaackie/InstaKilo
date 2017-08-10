//
//  CollectionViewController.m
//  InstaKiloNew
//
//  Created by Tye Blackie on 2017-08-09.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageSubjectDictionary = @{
                                 
                                 @"Work Photos":@[[UIImage imageNamed:@"10miles"],
                                                  [UIImage imageNamed:@"darylAndDog"],
                                                  [UIImage imageNamed:@"dingy"],
                                                  [UIImage imageNamed:@"luke"],
                                                  [UIImage imageNamed:@"crane"]],
                                 
                                 @"FireWorks":@[[UIImage imageNamed:@"iceCream"],
                                                [UIImage imageNamed:@"fireworks"]],
                                 
                                 @"Street Photos":@[[UIImage imageNamed:@"bigDub"],
                                                    [UIImage imageNamed:@"paintedAlley"],
                                                    [UIImage imageNamed:@"trump"]]
                             };
    
    self.imageLocationDictionary = @{
                                 @"Alberta":@[[UIImage imageNamed:@"10miles"],
                                              [UIImage imageNamed:@"darylAndDog"],
                                              [UIImage imageNamed:@"dingy"],
                                              [UIImage imageNamed:@"luke"]],
                                 
                                 @"Vancouver":@[[UIImage imageNamed:@"bigDub"],
                                                [UIImage imageNamed:@"crane"],
                                                [UIImage imageNamed:@"fireworks"],
                                                [UIImage imageNamed:@"iceCream"],
                                                [UIImage imageNamed:@"paintedAlley"],
                                                [UIImage imageNamed:@"trump"]]
                                     };
    
    self.categoryArray = @[@"Work Photos", @"FireWorks", @"Street Photos"];
    
    self.locationArray = @[@"Alberta", @"Vancouver"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.subjectLocation.selectedSegmentIndex == 0) {
         return self.categoryArray.count;
    }else{
        return self.locationArray.count;
    }
}

- (IBAction)subjectLocationButton:(id)sender {
        [self.collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (self.subjectLocation.selectedSegmentIndex == 0) {
        NSString *key = self.categoryArray[section];
        NSArray *categoryArray = [self.imageSubjectDictionary objectForKey:key];
        return categoryArray.count;
    }else{
        NSString *key = self.locationArray[section];
        NSArray *locationArray = [self.imageLocationDictionary objectForKey:key];
        return locationArray.count;
    }
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.subjectLocation.selectedSegmentIndex == 0) {
        NSString *key = [self.categoryArray objectAtIndex:indexPath.section];
        NSArray *imageArray = [self.imageSubjectDictionary valueForKey:key];
        cell.imageView.image = [imageArray objectAtIndex:indexPath.row];
    }else{
        NSString *key = [self.locationArray objectAtIndex:indexPath.section];
        NSArray *imageArray = [self.imageLocationDictionary valueForKey:key];
        cell.imageView.image = [imageArray objectAtIndex:indexPath.row];
    }
        return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (self.subjectLocation.selectedSegmentIndex == 0) {
            CollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionView" forIndexPath:indexPath];
            NSString *key = [self.categoryArray objectAtIndex:indexPath.section];
            headerView.sectionLabel.text = key;
            return headerView;
        }else{
            CollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionView" forIndexPath:indexPath];
                NSString *key = [self.locationArray objectAtIndex:indexPath.section];
            headerView.sectionLabel.text = key;
            return headerView;
    }

    return nil;
}
    return nil;
}
@end
    



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


