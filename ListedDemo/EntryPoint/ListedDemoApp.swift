//
//  ListedDemoApp.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 22/02/23.
//

import SwiftUI

@main
struct ListedDemoApp: App {
    @ObservedObject var homeViewModel: HomeViewModel = HomeViewModel(repository: HomeRepositoryImpl())
    
    init() {
        homeViewModel.fetchDataAndPopulate()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(homeViewModel)
            }
        }
    }
}
