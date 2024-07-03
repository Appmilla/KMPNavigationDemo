package screens

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

import navigation.Router

@Composable
fun NewsScreen(router: Router) {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text("News Screen")
            Spacer(modifier = Modifier.height(8.dp))
            Button(onClick = { router.navigate("/screens/home") }) {
                Text("Go to Home Screen")
            }
        }
    }
}

/*
@Composable
fun NewsScreen(router: Router) {
    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        Text("News Screen")
        Button(onClick = { router.navigate("/screens/home") }) {
            Text("Go to Home Screen")
        }
    }
}*/