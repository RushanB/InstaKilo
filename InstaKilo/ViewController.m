//
//  ViewController.m
//  InstaKilo
//
//  Created by Rushan on 2017-05-17.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "Photo.h"
#import "HeaderCollectionReusableView.h"

typedef NS_ENUM(NSUInteger, Section) {
    AllSection,
    LocationSection,
    SubjectSection,
};

#pragma mark PROPERTIES

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,weak) IBOutlet UICollectionView *photoCollectionView;
@property (nonatomic) Photo *myImages;

//@property (nonatomic) NSDictionary<NSString*, Photo*> *subjectD;
//@property (nonatomic) NSDictionary<NSString*, Photo*> *locationD;

@property (nonatomic) NSArray *keysArray;
@property (nonatomic) NSArray *dataDictionary;

@property (nonatomic) NSDictionary<NSString*, NSArray<Photo*>*> *currentDataDictionary;
@property (nonatomic) NSArray <NSString *>* currentKeys;

//
//@property (nonatomic) NSArray <NSString *>* subjectKeys;
//@property (nonatomic) NSArray <NSString *>* locationKeys;

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentChoice;
//@property (nonatomic) Section choiceOfSegment;
;


@end


#pragma mark PRINTCONTROLLER

@implementation ViewController

- (void)setSegmentChoice:(UISegmentedControl *)segmentChoice {
    self.currentKeys = self.keysArray[segmentChoice.selectedSegmentIndex];
    self.currentDataDictionary = self.dataDictionary[segmentChoice.selectedSegmentIndex];
    
    [self.photoCollectionView  reloadData];
    _segmentChoice = segmentChoice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //    self.myImages = [Photo new];
    //    [self.myImages getArrayOfImages];
    [self createImageArray];
    //self.photoCollectionView.dataSource;
    //CGFloat width = self.view.frame.size.width / 2;
    //((UICollectionViewFlowLayout *)self.photoCollectionView.collectionViewLayout).itemSize = CGSizeMake(width, width);
    
    self.segmentChoice = AllSection;
}
- (IBAction)segmentChosen:(UISegmentedControl*)sender {
//    self.choiceOfSegment = sender.selectedSegmentIndex;
//    [self.photoCollectionView reloadData];
    [self setSegmentChoice:sender];
}

#pragma mark PHOTOARRAYS + DICTIONARIES

-(void)createImageArray{
    Photo *p1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Bridge"] andSubject:@"City" andLocation:@"UK"];
    Photo *p2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Canyon"] andSubject:@"Landscape" andLocation:@"USA"];
    Photo *p3 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Green"] andSubject:@"Nature" andLocation:@"Canada"];
    Photo *p4 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Lights"] andSubject:@"City" andLocation:@"UK"];
    Photo *p5 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Milkway"] andSubject:@"Nature" andLocation:@"Canada"];
    Photo *p6 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Mountain"] andSubject:@"Landscape" andLocation:@"France"];
    Photo *p7 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Night"] andSubject:@"Landscape" andLocation:@"Ireland"];
    Photo *p8 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Ocean"] andSubject:@"Nature" andLocation:@"USA"];
    Photo *p9 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Purple"] andSubject:@"City" andLocation:@"USA"];
    Photo *p10 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"Yellow"] andSubject:@"City" andLocation:@"Italy"];
    
    NSDictionary *d1 = @{@"All":@[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]}; //sets content of first segment (ALL)
    
    NSDictionary *d2 = @{@"City":@[p1, p4, p9, p10], //Subject
                      @"Landscape":@[p2, p6, p7],
                      @"Nature":@[p3, p5, p8],
                      };
    
    
    
    NSDictionary *d3 = @{ @"UK":@[p1, p4],   //Locations
                        @"USA":@[p2, p8, p9],
                        @"Canada":@[p3, p5],
                        @"France":@[p6],
                        @"Ireland":@[p7],
                        @"Italy":@[p10]
                        };
    

    
    self.dataDictionary = @[d1, d2, d3];
    self.keysArray = @[d1.allKeys, d2.allKeys, d3.allKeys];  //Keys for the values
//    
//    self.subjectKeys = ;
//    
//    self.locationKeys = ;
    
//    self.arrayOfImages = [@[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]mutableCopy];
//    return self.arrayOfImages;
}


#pragma mark COLLECTIONVIEW

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [view setHeaderText:self.currentKeys[indexPath.section]];  //sets header text based on Dictionary Keys
        
        return view;
    }
    
    return nil;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
//    if (self.segmentChoice == 0) {
//        
//    } else {
//        
//    }
////    NSInteger numberOfSections;
////    if(self.choiceOfSegment == 0){
////        numberOfSections = self.subjectKeys.count;
////    }else if(self.choiceOfSegment == 1){
////        numberOfSections = self.locationKeys.count;
////    }
//    return numberOfSections;
    return self.currentKeys.count;  //returns number of Keys
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSInteger numberOfItemsInSection;
//    if(self.choiceOfSegment == 0){
//        NSArray *subjectValues = self.subjectD.allValues;
//        numberOfItemsInSection = [[subjectValues objectAtIndex:section]count];
//    }else{
//        NSArray *locationValues = self.locationD.allValues;
//        numberOfItemsInSection = [[locationValues objectAtIndex:section]count];
//    }
//    return numberOfItemsInSection;
    NSString *key = self.currentDataDictionary.allKeys[section];
    return self.currentDataDictionary[key].count;  //returns number of current data keys
}

- (PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [self.photoCollectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];  //sets photos to cell

    NSString *key = self.currentKeys[indexPath.section];
    NSArray *photos = self.currentDataDictionary[key];
    Photo *photo = photos[indexPath.row];
    cell.myImage.image = photo.image;  //returns photo image
    
    
    return cell;
}




@end
