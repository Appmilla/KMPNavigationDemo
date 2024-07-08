package screens

import androidx.compose.foundation.background
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import org.koin.compose.viewmodel.koinViewModel
import org.koin.core.annotation.KoinExperimentalAPI
import viewmodels.NewsViewModel

@OptIn(KoinExperimentalAPI::class)
@Composable
fun NewsScreen() {
    val newsViewModel = koinViewModel<NewsViewModel>()
    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(0.dp)
            .background(Color.Cyan),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Text("News Screen")
            Spacer(modifier = Modifier.height(8.dp))
            Button(onClick = { newsViewModel.navigateBack() }) {
                Text("Go to Home Screen")
            }
        }
    }
}