package screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import org.koin.compose.viewmodel.koinViewModel
import org.koin.core.annotation.KoinExperimentalAPI
import viewmodels.HomeViewModel

@OptIn(KoinExperimentalAPI::class)
@Composable
fun HomeScreen() {
    val homeViewModel = koinViewModel<HomeViewModel>()
    MaterialTheme {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.White)
                .padding(16.dp),
            contentAlignment = Alignment.TopCenter
        ) {
            Column(
                verticalArrangement = Arrangement.spacedBy(20.dp)
            ) {
                SectionView(
                    title = "Compose News Screen",
                    subtitle = "Explore the latest news",
                    description = "View the most recent news articles and updates in this section.",
                    buttonText = "Go to News Screen",
                    buttonAction = { homeViewModel.navigateToNews() }
                )
            }
        }
    }
}

@Composable
fun SectionView(
    title: String,
    subtitle: String,
    description: String,
    buttonText: String,
    buttonAction: () -> Unit
) {
    Column(
        modifier = Modifier
            .padding(16.dp)
            .background(Color.LightGray, RoundedCornerShape(15.dp))
            .padding(16.dp)
    ) {
        Text(
            text = title,
            style = MaterialTheme.typography.h6.copy(fontSize = 24.sp),
            modifier = Modifier.padding(bottom = 8.dp)
        )
        Text(
            text = subtitle,
            style = MaterialTheme.typography.subtitle1.copy(color = Color.Gray),
            modifier = Modifier.padding(bottom = 8.dp)
        )
        Text(
            text = description,
            style = MaterialTheme.typography.body1.copy(color = Color.Black),
            modifier = Modifier.padding(bottom = 16.dp)
        )
        Button(
            onClick = buttonAction,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(buttonText)
        }
    }
}
