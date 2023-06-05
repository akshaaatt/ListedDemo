//
//  HomeView.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 22/02/23.
//

import SwiftUI
import Charts
import SDWebImageSwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @State var selectedTopLinksTab: Bool = true
    
    var body: some View {
        let curColor = Constants.blue
        let curGradient = LinearGradient(
             gradient: Gradient (
                 colors: [
                     curColor.opacity(0.5),
                     curColor.opacity(0.2),
                     curColor.opacity(0.05),
                 ]
             ),
             startPoint: .top,
             endPoint: .bottom
        )
        
        VStack {
            VStack {
                TopBar()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text(greeting())
                                .foregroundColor(Constants.darkGrey)
                                .font(.callout)
                            
                            Spacer()
                        }
                        .padding(.top, 32)
                        .padding(.bottom, 4)
                        
                        HStack(spacing: 8) {
                            Text(homeViewModel.apiData?.supportWhatsappNumber ?? "")
                                .fontWeight(.semibold)
                                .font(.title)
                                .lineSpacing(32)
                                .foregroundColor(Constants.black)
                            
                            Image("hi")
                                .resizable()
                                .frame(width: 28, height: 28)
                            
                            Spacer()
                        }
                        .padding(.bottom, 24)
                        
                        ZStack {
                            if let chartData = homeViewModel.apiData?.data.overallURLChart {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    Chart {
                                        ForEach(chartData.sorted(by: { $0.key < $1.key }), id: \.key) { entry in
                                            LineMark(
                                                x: .value("Day", convertDate(from: "yyyy-MM-dd", to: "MMM dd", dateString: entry.key)),
                                                y: .value("Count", entry.value)
                                            )
                                            .interpolationMethod(.catmullRom)
                                            .foregroundStyle(curColor)
                                            .lineStyle(StrokeStyle(lineWidth: 1))
                                            
                                            AreaMark(
                                                x: .value("Day", convertDate(from: "yyyy-MM-dd", to: "MMM dd", dateString: entry.key)),
                                                y: .value("Count", entry.value)
                                            )
                                            .interpolationMethod(.catmullRom)
                                            .foregroundStyle(curGradient)
                                        }
                                    }
                                    .chartYAxis {
                                        AxisMarks(position: .leading)
                                    }
                                    .frame(width: CGFloat(chartData.count) * 60)
                                }
                                .padding(.top, 60)
                            }
                            
                            VStack {
                                HStack {
                                    Text("Overview")
                                        .font(.subheadline)
                                        .lineSpacing(20)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 4) {
                                        Text("\(homeViewModel.minDateString) - \(homeViewModel.maxDateString)")
                                            .foregroundColor(Constants.black)
                                            .font(.caption)
                                            .lineSpacing(12)
                                        
                                        Image("Time")
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                    }
                                    .padding()
                                    .cornerRadius(6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6).stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.08), lineWidth: 1)
                                    )
                                }
                                
                                Spacer()
                            }
                        }
                        .padding()
                        .frame(height: 320)
                        .background(Constants.white)
                        .cornerRadius(8)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Image("clicks")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(String(homeViewModel.apiData?.todayClicks ?? 0))
                                            .fontWeight(.semibold)
                                            .font(.callout)
                                            .lineSpacing(24)
                                        
                                        Text("Today’s clicks")
                                            .font(.subheadline)
                                            .lineSpacing(20)
                                    }
                                }
                                .frame(width: 120, height: 120)
                                .background(Color.white)
                                .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Image("location")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(homeViewModel.apiData?.topLocation ?? "")
                                            .fontWeight(.semibold)
                                            .font(.callout)
                                            .lineSpacing(24)
                                        
                                        Text("Top Location")
                                            .font(.subheadline)
                                            .lineSpacing(20)
                                    }
                                }
                                .frame(width: 120, height: 120)
                                .background(Color.white)
                                .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Image("source")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(homeViewModel.apiData?.topSource ?? "")
                                            .fontWeight(.semibold)
                                            .font(.callout)
                                            .lineSpacing(24)
                                        
                                        Text("Top source")
                                            .font(.subheadline)
                                            .lineSpacing(20)
                                            .fixedSize()
                                    }
                                }
                                .frame(width: 120, height: 120)
                                .background(Color.white)
                                .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Image("time")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("11:00 - 12:00")
                                            .fontWeight(.semibold)
                                            .font(.callout)
                                            .lineSpacing(24)
                                        
                                        Text("Best Time")
                                            .font(.subheadline)
                                            .lineSpacing(20)
                                    }
                                }
                                .frame(width: 120, height: 120)
                                .background(Color.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.vertical, 20)
                        
                        HStack {
                            Spacer()
                            
                            Image("Arrows")
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            Text("View Analytics")
                                .fontWeight(.semibold)
                                .font(.callout)
                                .lineSpacing(24)
                            
                            Spacer()
                        }
                        .frame(height: 48)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                        .padding(.horizontal, 1)
                        
                        HStack {
                            Text("Top Links")
                                .foregroundColor(selectedTopLinksTab ? Constants.white : Constants.darkGrey)
                                .fontWeight(.semibold)
                                .font(.callout)
                                .frame(width: 101, height: 36)
                                .background(selectedTopLinksTab ? Color(red: 0.05, green: 0.44, blue: 1) : Constants.bgColor)
                                .cornerRadius(18)
                                .onTapGesture {
                                    selectedTopLinksTab = true
                                    homeViewModel.links = (homeViewModel.apiData?.data.topLinks)!
                                }
                            
                            Text("Recent Links")
                                .padding()
                                .foregroundColor(!selectedTopLinksTab ? Constants.white : Constants.darkGrey)
                                .fontWeight(.semibold)
                                .font(.callout)
                                .frame(width: 140, height: 36)
                                .background(!selectedTopLinksTab ? Color(red: 0.05, green: 0.44, blue: 1) : Constants.bgColor)
                                .cornerRadius(18)
                                .onTapGesture {
                                    selectedTopLinksTab = false
                                    homeViewModel.links = (homeViewModel.apiData?.data.recentLinks)!
                                }
                            
                            Spacer()
                            
                            Image("search")
                                .resizable()
                                .frame(width: 36, height: 36)
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 28)
                        
                        ForEach(homeViewModel.links, id: \.urlID) { link in
                            VStack {
                                HStack {
                                    WebImage(url: URL(string: link.originalImage)!)
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading) {
                                        Text(link.title)
                                            .lineLimit(1)
                                            .font(.subheadline)
                                            .lineSpacing(24)
                                        
                                        Text(convertDate(from: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", to: "dd MMM yyyy", dateString: link.createdAt))
                                            .font(.caption)
                                            .lineSpacing(18)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 2) {
                                        Text(String(link.totalClicks))
                                            .fontWeight(.semibold)
                                            .font(.subheadline)
                                            .lineSpacing(24)
                                        
                                        Text("Clicks")
                                            .font(.caption)
                                            .lineSpacing(18)
                                    }
                                }
                                .padding(12)
                                
                                HStack{
                                    Text(link.webLink)
                                        .font(.subheadline)
                                        .lineSpacing(16)
                                        .frame(maxWidth: 213)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    Image("copy")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color(red: 0.91, green: 0.94, blue: 1))
                                .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                                .overlay(
                                    Rectangle()
                                        .strokeBorder(Color(red: 0.65, green: 0.78, blue: 1), style: StrokeStyle(lineWidth: 1, dash: [10]))
                                        .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                                )
                            }
                            .background(Constants.white)
                            .cornerRadius(8)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Image("Mail")
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            Text("View all Links")
                                .fontWeight(.semibold)
                                .font(.callout)
                                .lineSpacing(24)
                            
                            Spacer()
                        }
                        .frame(height: 48)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1))
                        .padding(.bottom, 40)
                        .padding(.top, 20)
                        .padding(.horizontal, 1)
                        
                        HelpSection()
                            .padding(.horizontal, 1)
                    }
                }
                .padding(.horizontal, 16)
                .background(Constants.bgColor)
                .cornerRadius(16, corners: [.topLeft, .topRight])
            }
            .background(Color(red: 0.05, green: 0.44, blue: 1))
            
            BottomBar()
        }
    }
    
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 5 && hour < 12 {
            return "Good morning"
        } else if hour >= 12 && hour < 17 {
            return "Good afternoon"
        } else if hour >= 17 && hour < 22 {
            return "Good evening"
        } else {
            return "Good night"
        }
    }
    
    func convertDate(from inputFormat: String, to outputFormat: String, dateString: String) -> String {
        let dateFormatter = DateFormatter()

        // Configure the input format
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("ERROR: Date conversion failed due to incorrect format.")
        }

        // Configure the output format
        dateFormatter.dateFormat = outputFormat

        // Convert the date
        return dateFormatter.string(from: date)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel(repository: HomeRepositoryImpl()))
    }
}
