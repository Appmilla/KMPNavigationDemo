package viewmodels

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.CoroutineScope
import navigation.Router

class HomeViewModel(
    coroutineScope: CoroutineScope,
    private val router: Router,
) : ViewModel(coroutineScope) {

    fun navigateToNews() {
        router.navigate("/screens/news")
    }

    fun navigateToUIKit() {
        router.navigate("/screens/uikit")
    }

    fun navigateToSharedNews() {
        router.navigate("/screens/newsCMP")
    }

    override fun onCleared() {
        super.onCleared()
        println("HomeViewModel onCleared")
    }
}
