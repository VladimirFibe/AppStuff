//
//  RideRequestView.swift
//  Uber
//
//  Created by Vladimir Fibe on 12/8/22.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            HStack(spacing: 20.0) {
                CircleSquare()
                VStack(alignment: .leading, spacing: 32) {
                    RideRequestRow(title: "Current location", time: "02:56 PM", color: .gray)
                    RideRequestRow(title: "Starbucks Coffee", time: "03:56 PM", color: .black)
                    
                }
            }
            
            Divider()
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        VStack(alignment: .leading) {
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 4) {
                                Text("UberX")
                                Text("22.04")
                            }
                            .padding(.horizontal, 8)
                        }
                        .frame(width: 112, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                        .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            
            Divider().padding(.vertical, 8)
            
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                
                Text("**** 1234")
                    .fontWeight(.bold)

                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
            }
            .padding(.horizontal)
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
                        
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct RideRequestRow: View {
    var title: String
    var time: String
    var color: Color
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(color)
            Spacer()
            Text(time)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray)
        }
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
