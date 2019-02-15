//
//  DLModelController.m
//  MovieSearch-C
//
//  Created by Dominic Lanzillotta on 2/15/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLMovieController.h"

@implementation DLMovieController

static NSString * const baseURlString = @"https://api.themoviedb.org/3/search/movie";
static NSString * const baseImageURlString = @"http://image.tmdb.org/t/p/w500/";


+ (void)fetchMoviesForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSMutableArray<DLMovie *> * _Nullable))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURlString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:@"4cf49922d5bd705f748eac021c458ccd"];
    NSURLQueryItem *searchTermQuery = [NSURLQueryItem queryItemWithName:@"query" value:[searchTerm lowercaseString]];
    
    components.queryItems = @[apiKey,searchTermQuery];
    
    NSURL *searchURL = components.URL;
    
    NSLog(@"%@",searchURL);

    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return ;
        }
        
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
            if (!topLevelDictionary) {
                NSLog(@"error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            NSMutableArray *results = topLevelDictionary[@"results"];
            NSMutableArray<DLMovie *> *movies = [NSMutableArray<DLMovie *> new];
            for (NSDictionary *result in results) {
                DLMovie *movie = [[DLMovie new] initWithDictionary:result];
                [movies addObject:movie];
            }
            completion(movies);
        }
    }] resume ];
}

+ (void)fetchImageForMovie:(DLMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseImageURlString];
    
    [baseURL URLByAppendingPathComponent:movie.imagePathURLAsString];
    NSLog(@"%@",baseURL);

    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return ;
        }
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            UIImage *moviepic = [[UIImage alloc] initWithData:data scale:1];
            completion(moviepic);
        }
    }] resume];
}

@end
