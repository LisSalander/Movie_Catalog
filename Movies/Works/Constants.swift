//
//  Constants.swift
//  Movies
//
//  Created by vika on 5/12/18.
//  Copyright © 2018 vika. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Public

public class Constants{
    
   static let URL_MOVIE = "https://api.themoviedb.org/3/discover/movie?api_key=900db9fe7e7cc81d7031dd26f63d3540&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page="
    static let URL_PICTURE = "https://image.tmdb.org/t/p/w185"
    static let URL_GENRE = "https://api.themoviedb.org/3/genre/movie/list?api_key=900db9fe7e7cc81d7031dd26f63d3540"
    static let errorJSON = "Error serializing json"
    
}

public struct Movies: Codable {
    
    let total_pages: Int
    let results: [Results]
    
    }

public struct Results: Codable{
   
    let title: String
    let movieID: Int
    let movieImageURL: String
    let movieDeskription: String
    let movieReleaseDate: String
    let movieVoteAverage: Double
    let movieGenreArray: [Int]

    private enum CodingKeys : String, CodingKey {
        case title
        case  movieID = "id"
        case  movieImageURL = "poster_path"
        case  movieDeskription = "overview"
        case  movieReleaseDate = "release_date"
        case  movieVoteAverage = "vote_average"
        case  movieGenreArray = "genre_ids"
    }
    
    static func endpointFotPage(_ page: Int) -> String {
        return Constants.URL_MOVIE + "\(page)"
    }
    
}

public struct Genres: Codable {
    let genre: [Genre]
}

public struct Genre: Codable {
    let genreID: Int?
    let genreName: String?
    
    private enum CodingKeys : String, CodingKey {
        case genreID = "id"
        case genreName = "name"
    }
}

