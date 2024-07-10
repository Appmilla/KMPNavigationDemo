package di

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelStore
import androidx.lifecycle.viewmodel.CreationExtras
import org.koin.compose.viewmodel.KoinViewModelFactory
import org.koin.core.annotation.KoinInternalApi
import org.koin.core.component.KoinComponent
import org.koin.core.parameter.ParametersDefinition
import org.koin.core.qualifier.Qualifier
import kotlin.reflect.KClass
import kotlinx.cinterop.ObjCClass
import kotlinx.cinterop.getOriginalKotlinClass

class KoinViewModelProvider : KoinComponent {

    @OptIn(KoinInternalApi::class)
    fun <T : ViewModel> resolveViewModel(
        vmClass: KClass<T>,
        viewModelStore: ViewModelStore,
        key: String? = null,
        extras: CreationExtras = CreationExtras.Empty,
        qualifier: Qualifier? = null,
        parameters: ParametersDefinition? = null,
    ): T {
        val koin = getKoin()
        val factory = KoinViewModelFactory(vmClass, koin.scopeRegistry.rootScope, qualifier, parameters)
        val provider = ViewModelProvider.create(viewModelStore, factory, extras)
        
        return when {
            key != null -> provider[key, vmClass]
            else -> provider[vmClass]
        }
    }
}

object ViewModelResolver : KoinComponent {
    fun <T : ViewModel> resolveViewModel(
        vmClass: KClass<T>,
        viewModelStore: ViewModelStore,
        key: String? = null
    ): T {
        val koinViewModelProvider = KoinViewModelProvider()

        return koinViewModelProvider.resolveViewModel(vmClass, viewModelStore, key)
    }
}

object KClassProvider {
    @OptIn(ExperimentalStdlibApi::class)
    fun getKClass(objCClass:ObjCClass): KClass<*> {
        val kClazz = getOriginalKotlinClass(objCClass)
        return kClazz ?: error("Could not find Kotlin class for ObjCClass: $objCClass")
    }
}
