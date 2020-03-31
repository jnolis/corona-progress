#* @post /
post_status <- function(res){
  token <- readRDS("token.rds")
  status <- paste0(paste0(sample(c("\u2593","\u2591"), size=15,replace=TRUE),collapse=""), " NA%")
  response <- rtweet::post_tweet(status=status,token=token)
  if(!is.null(response$status_code) && response$status_code == 200L){
    res$body <- "Tweet successfully posted"
    res
  } else {
    msg <- "An exception occurred."
    res$status <- 500
    list(error=jsonlite::unbox(msg))
  }
}
