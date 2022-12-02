import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .tint(.white)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "", subtitle: "")
    }
}
