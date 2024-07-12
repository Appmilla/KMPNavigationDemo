package repositories

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.*

@Serializable
data class Article(
    val title: String,
    val description: String,
    val url: String,
    val urlToImage: String
)

@Serializable
data class NewsResponse(
    val articles: List<JsonElement>
)

class NewsArticleRepository(
    private val httpClient: HttpClient,
    private val jsonConfiguration: Json) {

    fun getNews(): Flow<List<Article>> = flow {
        val apiKey = "YourAPIKey"
        
        val response: HttpResponse = httpClient.get("https://newsapi.org/v2/top-headlines") {
            parameter("country", "us")
            parameter("apiKey", apiKey)
        }

        // Deserialize response body into NewsResponse
        val newsResponse = response.body<NewsResponse>()

        // Filter out invalid articles and deserialize valid ones
        val articles = newsResponse.articles.mapNotNull { jsonElement ->
            try {
                val jsonObject = jsonElement.jsonObject
                val title = jsonObject["title"]?.jsonPrimitive?.contentOrNull
                val description = jsonObject["description"]?.jsonPrimitive?.contentOrNull
                val url = jsonObject["url"]?.jsonPrimitive?.contentOrNull
                val urlToImage = jsonObject["urlToImage"]?.jsonPrimitive?.contentOrNull

                if (title != null && description != null && url != null && urlToImage != null) {
                    jsonConfiguration.decodeFromJsonElement<Article>(jsonElement)
                } else {
                    null
                }
            } catch (e: Exception) {
                println("Error parsing JSON: ${e.message}")
                null
            }
        }

        emit(articles)
    }
}
