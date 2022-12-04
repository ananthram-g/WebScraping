#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://myanimelist.net/topanime.php?type=bypopularity#addedit"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating names
Name <- web %>% html_nodes(".anime_ranking_h3 a") %>%html_text()
View(Name)

#segregating description
Description <- web %>% html_nodes(".mt4") %>%html_text()
View(Description)

#segregating rating
Rating <- web %>% html_nodes(".js-top-ranking-score-col .score-label") %>%html_text()
View(Rating)

#segregating popularity ranking
Ranking <- web %>% html_nodes(".top-anime-rank-text") %>%html_text()
View(Ranking)

#creating dataframe
MAL <- data.frame(Name, Description, Rating, Ranking)
View(MAL)

#saving data
write.csv(MAL,"anime_list.csv")
