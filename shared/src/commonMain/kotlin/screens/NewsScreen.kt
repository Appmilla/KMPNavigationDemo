package screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import coil3.compose.AsyncImage
import org.koin.compose.viewmodel.koinViewModel
import org.koin.core.annotation.KoinExperimentalAPI
import repositories.Article
import viewmodels.NewsViewModel

@OptIn(KoinExperimentalAPI::class)
@Composable
fun NewsScreen() {
    val newsViewModel = koinViewModel<NewsViewModel>()
    val articles by newsViewModel.articles.collectAsState()
    var articlesLoaded by remember { mutableStateOf(false) }

    LaunchedEffect(Unit) {
        newsViewModel.fetchNews()
        articlesLoaded = true
    }

    if (articlesLoaded) {
        LazyColumn(
            modifier = Modifier.padding(8.dp)
        ) {
            items(articles) { article ->
                NewsListItem(article = article)
            }
        }
    } else {
        // Display a loading indicator or placeholder
        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Text(text = "Loading...")
        }
    }
}

@Composable
fun NewsListItem(article: Article) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp),
        shape = RoundedCornerShape(10.dp),
        elevation = 5.dp
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            AsyncImage(
                model = article.urlToImage,
                contentDescription = null,
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(10.dp)),
                contentScale = ContentScale.Crop
            )
            Spacer(modifier = Modifier.width(16.dp))
            Column {
                Text(text = article.title, style = MaterialTheme.typography.h6)
                Text(text = article.description, style = MaterialTheme.typography.body2)
            }
        }
    }
}