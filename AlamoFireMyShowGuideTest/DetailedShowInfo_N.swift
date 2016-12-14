//
//  DetailedShowInfo.swift
//  MyShowGuide
//
//  Created by Justin Doo on 12/6/16.
//  Copyright © 2016 Justin Doo. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper


class DetailInfo: Mappable {
  
  var firstAired : String?
  var network : String?
  var rating : String?
  
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    firstAired  <- map["first_aired"]
    network  <- map["network"]
    rating  <- map["rating"]
  }
}


class ArtInfo: Mappable {
  
  var poster: String?
  var artwork: String?
  var fanart: String?
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    poster  <- map["poster"]
    artwork  <- map["artwork_608x342"]
    fanart  <- map["fanart"]
  }
}


class ExploreInfo: Mappable {
  var metacritic: String?
  var imdbID: String?
  var wiki: NSNumber?
  var id: NSNumber?
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    metacritic <- map["metacritic"]
    imdbID <- map["imdb_id"]
    wiki <- map["wikipedia_id"]
    id <- map["id"]
  }
}


//MARK: Cast Info
class CastInfo: Mappable {
  
  var cast: [Cast]?
  
  required init?(map: Map) { }
  
   func mapping(map: Map) {
    
  cast  <- map["cast"]
  
  }
}



class Cast: Mappable {
  
  var name: String?
  var characterName: String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    characterName <- map["character_name"]
  }

  
}




//MARK: Social Info
class SocialInfo: Mappable {
  
  var channels: String?
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    
    channels <- map["channels.0.social.facebook.link"]
    
  }
}


//class SocialChannels: Mappable {
//  
//  var channels: [SocialSites]?
//  
//  required init?(map: Map) {
//  }
//  
//  func mapping(map: Map) {
//
//    channels <- map["social"]
//  
//  }
//}
//
//
//
//class SocialSites: Mappable {
//  
//  var facebookSocial: [Facebook]?
//  var twitterSocial: [Twitter]?
//  
//  
//  required init?(map: Map) {
//  }
//  
//  func mapping(map: Map) {
//    
//     facebookSocial <- map["facebook"]
//     twitterSocial <- map["twitter"]
//    
//  }
//  
//}
//
//
//class Facebook: Mappable {
//
//  var facebookLink: String?
//  
//  required init?(map: Map) {
//  }
//  
//  func mapping(map: Map) {
//    
//    facebookLink <- map["link"]
//    
//  }
//}
//
//
//class Twitter: Mappable {
//  
//  var twitterLink: String?
//  
//  required init?(map: Map) {
//  }
//  
//  func mapping(map: Map) {
//    twitterLink <- map["link"]
//  }
//}
