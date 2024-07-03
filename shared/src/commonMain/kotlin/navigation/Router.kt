package navigation

interface Router {
    fun navigate(uri: String)
    fun registerRoute(uri: String, screen: Screen)
}
