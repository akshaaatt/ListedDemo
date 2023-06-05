//
//  BottomBar.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 05/06/23.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack {
            VStack {
                Image("Mail")
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text("Links")
                    .fontWeight(.semibold)
                    .font(.caption2)
            }
            .frame(width: 60)
            
            Spacer()
            
            VStack {
                Image("Files")
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text("Courses")
                    .fontWeight(.semibold)
                    .font(.caption2)
            }
            .frame(width: 60)
            
            Spacer()

            Image("QR")
                .resizable()
                .frame(width: 110, height: 84)
                .padding(.bottom, 31)
            
            Spacer()

            VStack {
                Image("Media")
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text("Campaigns")
                    .fontWeight(.semibold)
                    .font(.caption2)
                    .fixedSize()
            }
            .frame(width: 60)
            
            Spacer()
            
            VStack {
                Image("Generic")
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Text("Profile")
                    .fontWeight(.semibold)
                    .font(.caption2)
            }
            .frame(width: 60)
        }
        .frame(height: 77)
        .frame(maxWidth: .infinity)
        .background(Constants.white)
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
