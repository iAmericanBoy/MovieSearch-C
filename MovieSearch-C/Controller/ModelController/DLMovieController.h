//
//  DLModelController.h
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLMovie.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLMovieController : NSObject

+(void)fetchMoviesForSearchTerm:(NSString *)searchTerm completion: (void (^_Nullable) (NSMutableArray<DLMovie *> *movies))completion;

+(void)fetchImageForMovie:(DLMovie *)movie completion: (void (^_Nullable) (UIImage *_Nullable pic))completion;

@end

NS_ASSUME_NONNULL_END
