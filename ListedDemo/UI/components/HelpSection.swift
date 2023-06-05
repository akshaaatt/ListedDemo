//
//  HelpSection.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 05/06/23.
//

import SwiftUI

struct HelpSection: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("talk")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading, 12)
            
            Text("Talk with us")
                .fontWeight(.semibold)
                .font(.callout)
                .lineSpacing(24)
            
            Spacer()
        }
        .frame(height: 64)
        .background(Color(red: 0.29, green: 0.82, blue: 0.37, opacity: 0.12))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.29, green: 0.82, blue: 0.37, opacity: 0.32), lineWidth: 1)
        )
        .padding(.bottom, 16)
        
        HStack(spacing: 12) {
            Image("faq")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading, 12)
            
            Text("Frequently Asked Questions")
                .fontWeight(.semibold)
                .font(.callout)
                .lineSpacing(24)
            
            Spacer()
        }
        .frame(height: 64)
        .background(Color(red: 0.91, green: 0.94, blue: 1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.05, green: 0.44, blue: 1, opacity: 0.32), lineWidth: 1)
        )
        .padding(.bottom, 60)
    }
}

struct HelpSection_Previews: PreviewProvider {
    static var previews: some View {
        HelpSection()
    }
}
