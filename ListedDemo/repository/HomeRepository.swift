//
//  HomeRepository.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 22/02/23.
//

import Foundation
import Combine
import Alamofire

protocol HomeRepository {
    func fetchData () -> AnyPublisher<APIData,AFError>
}
