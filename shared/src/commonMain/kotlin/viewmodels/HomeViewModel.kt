package viewmodels

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.CoroutineScope
import navigation.Router

class HomeViewModel(
    private val viewModelScope: CoroutineScope,
    private val router: Router,
) : ViewModel(viewModelScope) {

    fun navigateToNews() {
        router.navigate("/screens/news")
    }
}
