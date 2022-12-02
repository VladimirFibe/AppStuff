import SwiftUI
import MapKit

final class LocationSearchViewModel: NSObject, ObservableObject {
    //MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]()
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment = "" { didSet { searchCompleter.queryFragment = queryFragment }}
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
}
//MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
        print(self.results.count)
    }
}
