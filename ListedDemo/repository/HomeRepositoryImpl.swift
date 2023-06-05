//
//  HomeRepositoryImpl.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 22/02/23.
//

import Foundation
import Alamofire
import Combine

class HomeRepositoryImpl: HomeRepository {
    
    func fetchData() -> AnyPublisher<APIData, AFError> {
        let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        ]
        
        return AF.request(url, method: .get, headers: headers)
            .validate()
            .publishDecodable(type: APIData.self)
            .value()
            .eraseToAnyPublisher()
    }
}
