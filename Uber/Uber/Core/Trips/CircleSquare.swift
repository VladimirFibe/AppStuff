//
//  CircleSquare.swift
//  Uber
//
//  Created by Vladimir Fibe on 12/8/22.
//

import SwiftUI

struct CircleSquare: View {
    var width = 8.0
    var height = 32.0
    var body: some View {
        VStack {
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: width, height: width)
            Rectangle()
                .fill(Color(.systemGray3))
                .frame(width: 1, height: height)
            Rectangle()
                .fill(.black)
                .frame(width: width, height: width)
        }
    }
}

struct CircleSquare_Previews: PreviewProvider {
    static var previews: some View {
        CircleSquare()
    }
}
