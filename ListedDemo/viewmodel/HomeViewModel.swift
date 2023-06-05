//
//  HomeViewModel.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 22/02/23.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    @Published var apiData: APIData?
    @Published var minDateString = ""
    @Published var maxDateString = ""
    @Published var links: [Link] = [Link]()
    private var subscriptions: Set<AnyCancellable> = []

    var repository: HomeRepository
    
    init(repository: HomeRepository) {
        self.repository = repository
    }
    
    func fetchDataAndPopulate() {
        repository.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                print(completion)
            }, receiveValue: {value in
                self.apiData = value
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dates = value.data.overallURLChart.keys.compactMap { dateFormatter.date(from: $0) }
                
                self.links = value.data.topLinks

                // Find the minimum and ListedDemoimum dates
                if let minDate = dates.min(), let maxDate = dates.max() {
                    // Change the date formatter to output in the desired format
                    dateFormatter.dateFormat = "dd MMM"
                    
                    self.minDateString = dateFormatter.string(from: minDate)
                    self.maxDateString = dateFormatter.string(from: maxDate)
                }
            })
            .store(in: &subscriptions)
    
    }
}
