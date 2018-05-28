//
//  NetworkService.swift
//  Movies
//
//  Created by vika on 5/12/18.
//  Copyright © 2018 vika. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Parsing API

class NetworkService {
    
    func downloadData(URL_DATA: String) {
        
        guard let url = URL(string: URL_DATA) else
        {return}
        
        URLSession.shared.dataTask(with: url) { (data, tesponse, error) in
            
            guard let data = data else {return}
            switch(URL_DATA){
            case Constants.URL_MOVIE:
                self.decoderMovie(data: data)
            case Constants.URL_GENRE:
                self.decodeGenre(data: data)
            default:
                break
            }
            
            }.resume()
    }
    
    // MARK: -
    // MARK: Decode movie data
    
    func decoderMovie(data: Data) {
        
        do{

            let movieDecode = try JSONDecoder().decode(Movies.self, from: data)
            let movieTotalPages: Int = movieDecode.total_pages
            
            for page in 1...movieTotalPages {
                self.downloadData(URL_DATA: Results.endpointFotPage(page))

                for i in 0...movieDecode.results.count{
                    let movieElement = movieDecode.results[i]
                    print(movieElement)
                }
                
            }
            
        } catch let jsonError {
            print(Constants.errorJSON, jsonError)
        }
    }
    
    // MARK: -
    // MARK: Decode genre data
    
    func decodeGenre(data: Data) {
        do{
            
            let genreDecode = try JSONDecoder().decode(Genres.self, from: data)
            
            for i in 0...genreDecode.genre.count{
                let genreElement = genreDecode.genre[i]
                print(genreElement)
            }
            
        } catch let jsonError {
            print(Constants.errorJSON, jsonError)
        }
    }

}

