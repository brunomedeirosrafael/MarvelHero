//
//  HerosProvider.swift
//  MarvelHero
//
//  Created by Bruno Medeiros Rafael on 07/01/2018.
//  Copyright © 2018 Bruno Medeiros Rafael. All rights reserved.
//

import Foundation

typealias HeroCallback = (() throws -> [String: AnyObject]?) -> Void

struct HeroProvider {
    
    let kBaseUrl = "http://gateway.marvel.com/v1/public"
    let kEntityKey = "characters"
    
    func getHeros(completion:@escaping HeroCallback) {
        let session = URLSession.shared
        guard let request = authenticatedRequest(entity: kEntityKey) else {
            return
        }
        let task = session.dataTask(with: request) { (data, response, error) in
            do {
                guard error == nil else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let dataResponse = data else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    guard let json = try JSONSerialization.jsonObject(with: dataResponse, options: .mutableLeaves) as? NSDictionary else {
                        completion { throw TecnicalError.requestError }
                        
                        return
                    }
                    
                    completion { json as? [String: AnyObject] }
                default:
                    completion { throw TecnicalError.requestError }
                }
            } catch {
                completion { throw TecnicalError.requestError }
            }
        
        }
        task.resume()
    }
    
    // MARK: - Private Methods
    private func getBaseUrl(entity:String) -> String{
        return "\(kBaseUrl)/\(entity)?ts=1&apikey=611876fc79cd46911c5abbd998e7b8a7&hash=f979a36358f17680f7cbf8c6eb4658cb"
    }
    
    private func authenticatedRequest(entity: String) -> URLRequest? {
        guard let url = URL(string: getBaseUrl(entity: kEntityKey)) else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }
    
}
