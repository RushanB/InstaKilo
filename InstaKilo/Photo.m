//
//  Photo.m
//  InstaKilo
//
//  Created by Rushan on 2017-05-17.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithImage:(UIImage *)image andSubject:(NSString *)subject andLocation:(NSString *)location{
    self = [super init];
    if(self) {
        
        _image = image;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
