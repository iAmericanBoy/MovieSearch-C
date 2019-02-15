//
//  Movie.m
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLMovie.h"

@implementation DLMovie

- (instancetype)initWithTitle:(NSString *)title overview:(NSString *)overview imagePathURLAsString:(NSString *)urlPath rating:(float)rating
{
    self = [super init];
    if(self) {
        _title = title;
        _overview = overview;
        _imagePathURLAsString = urlPath;
        _rating = rating;
    }
    return self;
}

@end

@implementation DLMovie  (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *overview = dictionary[@"overview"];
    NSString *pathURL = dictionary[@"poster_path"];
    float rating = [dictionary[@"vote_average"]floatValue];
    
    if (!rating) {
        rating = 0.0;
    }
    NSLog(@"%@", pathURL);
    
    return [self initWithTitle:title overview:overview imagePathURLAsString:pathURL rating: rating];
}

@end
