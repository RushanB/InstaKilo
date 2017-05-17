//
//  HeaderCollectionReusableView.m
//  InstaKilo
//
//  Created by Rushan on 2017-05-17.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "HeaderCollectionReusableView.h"
#import "Photo.h"

@interface HeaderCollectionReusableView()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;


@end

@implementation HeaderCollectionReusableView

- (void)setHeaderText:(NSString *)text {
    self.headerLabel.text = text;
}



@end
