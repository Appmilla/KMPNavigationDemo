import Foundation
import Shared
import Combine

extension ViewModel: ObservableObject {
    public var objectWillChange: ObservableObjectPublisher {
        return ObservableObjectPublisher()
    }
}

