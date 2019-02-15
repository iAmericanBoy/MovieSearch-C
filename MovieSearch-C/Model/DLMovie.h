//
//  Movie.h
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLMovie : NSObject

@property(nonatomic, readwrite, nonnull) NSString *title;
@property(nonatomic, readwrite, nonnull) NSString *overview;
@property(nonatomic, readwrite, nullable) NSString *imagePathURLAsString;
@property(nonatomic, readwrite) float rating;

-(instancetype)initWithTitle:(NSString *)title
                    overview:(NSString *)overview
        imagePathURLAsString:(NSString *)urlPath
                      rating:(double )rating;

@end
@interface DLMovie  (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
