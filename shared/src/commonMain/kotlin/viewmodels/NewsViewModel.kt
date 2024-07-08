package viewmodels

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.CoroutineScope

import navigation.Router

class NewsViewModel(
    private val viewModelScope: CoroutineScope,
    private val router: Router,
) : ViewModel(viewModelScope) {

    fun navigateBack() {
        router.pop()
    }

    override fun onCleared() {
        super.onCleared()
        println("NewsViewModel onCleared")
    }
}