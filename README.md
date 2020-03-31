# Coronavirus Progress twitter app

<img src="misc/avatar.png" align="right"  height="150px"/>

This app publishes once a day a random progress of the virus using R, Docker, and Google Cloud Run. This also provides a great example of how to make a Twitter bot in R and deploy it.

## Files in the repository

The repository contains a few key files for running a RESTful API to control posting tweets. It uses R with the plumber package to do so, check out [this blog series](https://medium.com/tmobile-tech/r-can-api-c184951a24a3) for more details on how to do it.

* `rest_controller.R` - the plumber RESTful API that receives the command to publish a tweet and does so
* `main.R` - the command that starts the RESTful API. 
* `setup.R` - run when the package is built, this installs the R packages.
* `Dockerfile` - this controls building the docker container
* `token.rds` [missing] - this file has the rtweet credentials to post the tweet, but is not included in the repo for security purposes. Check out the [rtweet documentation](https://rtweet.info/) on how to make this.

## Deploying to Google Cloud Run

Once you build the Docker image for your bot, you can upload it to [Google Cloud Run](https://cloud.google.com/run/docs). Once you've done that you can either have posting the tweets be controlled by an outside service hitting the API, or you can schedule it to happen automatically using [Google Cloud Scheduler](https://cloud.google.com/scheduler).