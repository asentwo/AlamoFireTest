//
//  NetworkManager.swift
//  MyShowGuide
//
//  Created by Justin Doo on 12/6/16.
//  Copyright © 2016 Justin Doo. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper
import SwiftyJSON

class NetworkManager: NSObject {
  
  
  static let sharedManager = NetworkManager()
  
  private let apiKey = "rKk09BXyG0kXF1lnde9GOltFq6FfvNQd"
  let baseURL = "http://api-public.guidebox.com/v1.43/us"
  
  //var socialArray: [SocialInfo] = []
  
  
  func getAllJSONInfo () {
    
    Alamofire.request("\(baseURL)/\(apiKey)/show/950").responseJSON { response in
      print(response.request!)  // original URL request
      print(response.response!) // HTTP URL response
      print(response.data!)     // server data
      print(response.result)   // result of response serialization
      
      if let JSON = response.result.value {
        print("JSON: \(JSON)")
      }
    }
  }
  
  
  
  func getDetailInfo (completionHandler: @escaping (DetailInfo?,Error?) -> ()) {
    
    Alamofire.request("\(baseURL)/\(apiKey)/show/950", method: .get, encoding: JSONEncoding.default)
      
      .validate ()
      .responseObject{  (response: DataResponse<DetailInfo>) in
        
        
        switch response.result {
        case .success:
          let detailInfo = response.result.value
          completionHandler(detailInfo!, nil)
          
        case .failure(let error):
          print("Sorry there was an error: \(error)")
          completionHandler(nil,error)
          return
        }
    }
    
    
  }
  
  func getArtInfo (completionHandler: @escaping (ArtInfo?, Error?) -> ()) {
    
    Alamofire.request("\(baseURL)/\(apiKey)/show/950", method: .get, encoding: JSONEncoding.default)
      
      .validate ()
      .responseObject{  (response: DataResponse<ArtInfo>) in
        switch response.result {
        case .success:
          let artInfo = response.result.value
          completionHandler(artInfo!, nil)
          
        case .failure(let error):
          
          print("Sorry there was an error: \(error)")
          completionHandler(nil,error)
          return
        }
    }
    
  }
  
  func getSocialInfo (completionHandler: @escaping (SocialInfo?, Error?) -> ()){
    
    Alamofire.request("\(baseURL)/\(apiKey)/show/950", method: .get, encoding: JSONEncoding.default).validate ()
      .responseObject{  (response: DataResponse<SocialInfo>) in

        switch response.result {
        case .success:
          let socialInfo = response.result.value
         
//         print("This is the social info \(socialInfo?.channels?.first?.channels?.first?.facebookSocial?.first?.facebookLink)")
          
          print("This is the social info \(socialInfo?.channels)")
          
          completionHandler(socialInfo!, nil)
          
        case .failure(let error):
          
          print("Sorry there was an error: \(error)")
          completionHandler(nil,error)
          return
        }

  }
}
  
  

  
  
  func getCastInfo (completionHandler: @escaping (CastInfo?, Error?) -> ()) {
    
    Alamofire.request("\(baseURL)/\(apiKey)/show/950", method: .get, encoding: JSONEncoding.default)
      
      .validate ()
      .responseObject{  (response: DataResponse<CastInfo>) in
        switch response.result {
        case .success:
          let castInfo = response.result.value
          
          print (castInfo?.cast?.first?.name ?? "")
          
          completionHandler(castInfo!, nil)
          
        case .failure(let error):
          
          print("Sorry there was an error: \(error)")
          completionHandler(nil,error)
          return
        }
    }
    
  }


}

