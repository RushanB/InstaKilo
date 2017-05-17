//
//  Photo.h
//  InstaKilo
//
//  Created by Rushan on 2017-05-17.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *subject;
@property (nonatomic) NSString *location;

@property (nonatomic) NSMutableDictionary *subjectD;
@property (nonatomic) NSMutableDictionary *locationD;
@property (nonatomic) NSMutableArray *arrayOfImages;


-(NSMutableArray *)getArrayOfImages;

//-(instancetype)initWithImage:(UIImage *)image andSubject:(NSString *)subject andLocation:(NSString *)location;

@end
