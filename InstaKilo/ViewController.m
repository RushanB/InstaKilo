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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,weak) IBOutlet UICollectionView *photoCollectionView;
//@property (nonatomic) Photo *myImages;
@property (nonatomic) NSDictionary<NSString*, Photo*> *subjectD;
@property (nonatomic) NSDictionary<NSString*, Photo*> *locationD;
@property (nonatomic) NSArray <NSString *>* subjectKeys;
@property (nonatomic) NSArray <NSString *>* locationKeys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //    self.myImages = [Photo new];
    //    [self.myImages getArrayOfImages];
    [self createImageArray];
    NSLog()
    
}

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
    
    self.subjectD = @{@"City":@[p1.image, p4.image, p9.image, p10.image],
                      @"Landscape":@[p2.image, p6.image, p7.image],
                      @"Nature":@[p3.image, p5.image, p8.image],
                      };
    
    self.subjectKeys = [self.subjectD allKeys];
    
    self.locationD = @{ @"UK":@[p1.image, p4.image],
                        @"USA":@[p2.image, p8.image, p9.image],
                        @"Canada":@[p3.image, p5.image],
                        @"France":@[p6.image],
                        @"Ireland":@[p7.image],
                        @"Italy":@[p10.image]
                        };
    self.locationKeys = [self.locationD allKeys];
    
//    self.arrayOfImages = [@[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]mutableCopy];
    
//    return self.arrayOfImages;
}

// implement the required datasource methods


@end
