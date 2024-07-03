package screens

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import navigation.Router


@Composable
fun HomeScreen(router: Router) {
    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text("Home Screen")
        Button(onClick = { router.navigate("/screens/news") }) {
            Text("Go to News Screen")
        }
    }
}