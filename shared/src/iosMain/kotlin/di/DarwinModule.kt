package di

import navigation.DarwinRouter
import org.koin.dsl.module
import platform.UIKit.UINavigationController

val darwinModule = module {
    factory { (navigationController: UINavigationController) -> DarwinRouter(navigationController) }
}

