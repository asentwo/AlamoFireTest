//
//  ViewController.swift
//  AlamoFireMyShowGuideTest
//
//  Created by Justin Doo on 12/8/16.
//  Copyright © 2016 JustinDoo. All rights reserved.
//

import UIKit
import SDWebImage

class TestViewController: UIViewController {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var overviewLabel: UILabel!
  @IBOutlet weak var facebookLabel: UILabel!
  
  let nm = NetworkManager.sharedManager
  
  
  var artArray: [ArtInfo] = []
  var detailArray: [DetailInfo] = []
  var socialArray: [SocialInfo] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nm.getAllJSONInfo()
        
    nm.getArtInfo(completionHandler: { artInfo, error in
      
    //  self.artArray = [artInfo!]
      
      if let urlString = artInfo?.poster {
        if let url = URL(string: urlString) {
          self.imageView.sd_setImage(with: url, placeholderImage: nil)
        }
      }
    })
    
    nm.getDetailInfo(completionHandler: {detailInfo, error in
      
    //  self.detailArray = [detailInfo!]
      
      if detailInfo?.network != nil {
        self.overviewLabel.text = detailInfo?.network
      }
    })
    
    
    nm.getSocialInfo(completionHandler: {socialInfo, error in

      
//      if socialInfo?.socialDict != nil {
//      
//      self.facebookLabel.text = socialInfo?.facebookLink
      
  //    self.facebookLabel.text = socialArray.filter($0.facebook)
    //  }
      
    })
  
  
  
  
    nm.getCastInfo(completionHandler: {castInfo, error in
      
      
//      if castInfo?.name != nil {
//        print(castInfo?.name!)
//      }
      
      
    })
  
  
  
  }
  
  
  
  
  
}

