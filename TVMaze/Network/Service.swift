//
//  Service.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 10/10/20.
//

import Foundation
import Alamofire
import SwiftyJSON

var apiURL = "http://api.tvmaze.com/schedule"

func getSchedule(successHandler: (([Show]) -> Void)?, errorHandler: ((String?) -> Void)?) {
    AF.request(apiURL).response { response in
        switch response.result {
        case .success(let value):
            guard let value = value else { return }
            let json = JSON(value)
            var successModels = [Show]()
            
            for i in 0...json.count-1 {
                var tempModel = Show()
                tempModel.jsonMapper(json: json[i])
                
                successModels.append(tempModel)
            }
            
            successHandler?(successModels)
        case .failure(let error):
            print(error)
        }
    }
}
