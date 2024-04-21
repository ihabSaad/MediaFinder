//
//  networks.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import UIKit
import Alamofire

class ApiManger {
    
//  MARK:  Singleton -
   static let Shard = ApiManger()
    
    func getMediaData(baseUrl: String, completion: @escaping ( _ DataFaild : Error?,  _ arrMedia: [Media]?) -> Void) {
        AF.request(baseUrl, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
             
              guard response.error == nil else {
                print("Error , get DAta Api !!")
                  completion(response.error,nil)
                return
            }
              guard let data = response.data else {
                print("Error , get DAta Api !!")
                return
            }
            
            do {
                let deCoder = JSONDecoder()
                let getDataApi = try deCoder.decode(MediaResponse.self, from: data)
                let arrMedieaData = getDataApi.results
                completion(nil, arrMedieaData)
            } catch let Error {
                print("error data Api completion")
                print(Error.localizedDescription)
            }
        }
    }
}
