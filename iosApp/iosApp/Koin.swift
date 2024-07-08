import Foundation
import UIKit
import Shared

final class Koin {
    private var core: Koin_coreKoin?

    static let instance = Koin()

    static func start(router: Router) {
        if instance.core == nil {
            let koinApp = KoinDarwinKt.doInitKoin(router: router)
            let koin = koinApp.koin
            
            instance.core = koin
        }
        if instance.core == nil {
            fatalError("Can't initialize Koin.")
        }
    }

    func getScope() -> Koin_coreScope? {
        return core?.scopeRegistry.rootScope
    }

    private init() {}
}


/*
final class Koin {
    
    private var core: Koin_coreKoin?

    static let instance = Koin()

    static func start(router: Router) {
        if instance.core == nil {
            let koinApp = KoinDarwinKt.doInitKoin(router: router)
            let koin = koinApp.koin
            
            instance.core = koin
        }
        if instance.core == nil {
            fatalError("Can't initialize Koin.")
        }
    }

    func getCore() -> Koin_coreKoin? {
            return core
        }
    
    private init() {
    }
}*/
