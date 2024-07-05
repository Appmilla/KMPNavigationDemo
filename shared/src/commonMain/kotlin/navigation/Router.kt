package navigation

interface Router {
    fun navigate(uri: String)
    fun pop()
    fun registerRoute(uri: String, screen: Screen)
}
