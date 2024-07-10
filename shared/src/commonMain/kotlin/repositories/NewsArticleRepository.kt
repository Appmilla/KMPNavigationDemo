package repositories

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.client.statement.HttpResponse
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

@Serializable
data class Article(
    val title: String,
    val description: String?,
    val url: String,
    val urlToImage: String?
)

@Serializable
data class NewsResponse(
    val articles: List<Article>
)

class NewsArticleRepository(private val httpClient: HttpClient) {
    fun getNews(): Flow<List<Article>> = flow {
        val apiKey = "1ac377d9bc4c4b07885c0130bd777c66"
        val response: HttpResponse = httpClient.get("https://newsapi.org/v2/top-headlines") {
            parameter("country", "us")
            parameter("apiKey", apiKey)
        }

        val articles = response.body<NewsResponse>().articles
            .filter { it.title.isNotEmpty() && it.url.isNotEmpty() && it.urlToImage != null }

        emit(articles)
    }
}

// Configure HttpClient for JSON serialization
val jsonClient = HttpClient {
    install(ContentNegotiation) {
        json(Json {
            ignoreUnknownKeys = true // Adjust as needed
            isLenient = true
            coerceInputValues = true // Coerce null values to default values
        })
    }
}
