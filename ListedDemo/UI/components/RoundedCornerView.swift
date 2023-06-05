//
//  RoundedCornerView.swift
//  ListedDemo
//
//  Created by Akshat Tiwari on 05/06/23.
//

import Foundation
import SwiftUI

struct RoundedCornerView: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCornerView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerView()
    }
}
