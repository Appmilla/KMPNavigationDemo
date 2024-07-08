package di

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import org.koin.compose.viewmodel.dsl.viewModel

import org.koin.dsl.module
import viewmodels.HomeViewModel
import viewmodels.NewsViewModel

val commonModule =
    module {
        viewModel { HomeViewModel(get(), get()) }
        viewModel { NewsViewModel(get(), get()) }
        factory { CoroutineScope(SupervisorJob() + Dispatchers.Main) }
    }