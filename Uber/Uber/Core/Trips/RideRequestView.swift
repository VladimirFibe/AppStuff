import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType = RideType.uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            HStack(spacing: 20.0) {
                CircleSquare()
                VStack(alignment: .leading, spacing: 32) {
                    RideRequestRow(title: "Current location",
                                   time: locationViewModel.pickupTime ?? "",
                                   color: .gray)
                    if let location = locationViewModel.selectedUberLocation {
                        RideRequestRow(title: location.title,
                                       time: locationViewModel.dropOffTime ?? "",
                                       color: .theme.primaryTextColor)
                    }
                    
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
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description)
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                            }
                            .padding()
                        }
                        .frame(width: 112, height: 140)
                        .background(type == selectedRideType ? Color(.systemBlue) : Color.theme.secondaryBackgroundColor)
                        .foregroundColor(type == selectedRideType ? .white : .theme.primaryTextColor)
                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .font(.system(size: 14, weight: .semibold))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
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
            .background(Color.theme.secondaryBackgroundColor)
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
        .background(Color.theme.backgroundColor)
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
            .environmentObject(LocationSearchViewModel())
    }
}
