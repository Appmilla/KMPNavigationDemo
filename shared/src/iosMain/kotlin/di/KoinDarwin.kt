package di

import kotlinx.cinterop.BetaInteropApi
import kotlinx.cinterop.ObjCClass
import kotlinx.cinterop.getOriginalKotlinClass
import navigation.Router
import org.koin.core.Koin
import org.koin.core.KoinApplication
import org.koin.core.component.KoinComponent
import org.koin.core.module.Module
import org.koin.core.parameter.parametersOf
import org.koin.core.qualifier.Qualifier
import org.koin.dsl.bind
import org.koin.dsl.module
import viewmodels.HomeViewModel
import viewmodels.NewsViewModel

@BetaInteropApi
fun Koin.get(objCClass: ObjCClass): Any {
    val kClazz = getOriginalKotlinClass(objCClass)!!
    return get(kClazz, null, null)
}

@BetaInteropApi
fun Koin.get(
    objCClass: ObjCClass,
    qualifier: Qualifier?,
    parameter: Any,
): Any {
    val kClazz = getOriginalKotlinClass(objCClass)!!
    return get(kClazz, qualifier) { parametersOf(parameter) }
}

inline fun <reified T : Any> Module.singleInstance(instance: T) {
    single(createdAtStart = true) { instance } bind T::class
}

inline fun <reified T : Any> Module.factoryInstance(instance: T) {
    factory { instance } bind T::class
}

fun initKoin(router: Router): KoinApplication {
    val iosDependenciesModule = module {
        single { router }
    }
    return KoinInitializer().init(iosDependenciesModule)
}

@Suppress("unused") // Called from Swift
object KotlinDependencies : KoinComponent {
    fun getRouter() = getKoin().get<Router>()
    fun getHomeViewModel() = getKoin().get<HomeViewModel>()
    fun getNewsViewModel() = getKoin().get<NewsViewModel>()
}