
import Foundation
import Shared
import Combine

extension IOSRouter: ObservableObject {
    public var objectWillChange: ObservableObjectPublisher {
        return ObservableObjectPublisher()
    }
}
