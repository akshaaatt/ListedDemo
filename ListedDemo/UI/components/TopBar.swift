//
//  TopBar.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 05/06/23.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack {
            Text("Dashboard")
                .foregroundColor(Constants.white)
                .fontWeight(.semibold)
                .font(.title)
                .foregroundColor(Color.white)
                .lineSpacing(24)
                .padding(.leading)
            
            Spacer()
            
            Image("settings")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.top, 40)
        .padding(.bottom, 20)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
