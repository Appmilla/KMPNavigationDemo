package di

import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.serialization.kotlinx.json.json
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.serialization.json.Json
import org.koin.compose.viewmodel.dsl.viewModel

import org.koin.dsl.module
import repositories.NewsArticleRepository
import viewmodels.HomeViewModel
import viewmodels.NewsViewModel

val jsonConfiguration = Json {
    ignoreUnknownKeys = true
    isLenient = true
}

val jsonClient = HttpClient {
    install(ContentNegotiation) {
        json(jsonConfiguration)
    }
}

val commonModule =
    module {
        single { jsonClient }
        single { jsonConfiguration }
        single { NewsArticleRepository(get(), get()) }
        viewModel { HomeViewModel(get(), get()) }
        viewModel { NewsViewModel(get(), get(), get()) }
        factory { CoroutineScope(SupervisorJob() + Dispatchers.Main) }
    }