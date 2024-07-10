package viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import navigation.Router
import repositories.Article
import repositories.NewsArticleRepository

class NewsViewModel(
    coroutineScope: CoroutineScope,
    private val router: Router,
    private val newsArticleRepository: NewsArticleRepository,
) : ViewModel(coroutineScope) {
    private val _articles = MutableStateFlow<List<Article>>(emptyList())
    val articles: StateFlow<List<Article>> = _articles

    fun fetchNews() {
        viewModelScope.launch {
            newsArticleRepository.getNews().collect {
                _articles.value = it
            }
        }
    }

    fun navigateBack() {
        router.pop()
    }

    override fun onCleared() {
        super.onCleared()
        println("NewsViewModel onCleared")
    }
}