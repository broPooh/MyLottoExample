//
//  APICall.swift
//  MyLottoExample
//
//  Created by bro on 2022/05/09.
//

import UIKit
import Alamofire
import SwiftyJSON

class APICall {
    
    static let shared = APICall()
    
    
    func getLotto(round: String) {
        
        guard let url = Constants.getLottoNumUrl(round: round) else {
            return
        }
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
            case.failure(let error):
                let jsonData = JSON(error)
            }
        }
        
    }
    
}
