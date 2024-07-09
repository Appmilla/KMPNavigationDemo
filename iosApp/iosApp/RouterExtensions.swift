
import Foundation
import Shared
import Combine

extension DarwinRouter: ObservableObject {
    public var objectWillChange: ObservableObjectPublisher {
        return ObservableObjectPublisher()
    }
}

extension ViewModel: ObservableObject {
    public var objectWillChange: ObservableObjectPublisher {
        return ObservableObjectPublisher()
    }
}
