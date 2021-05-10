# [How to set up rselenium for R](https://stackoverflow.com/questions/42468831/how-to-set-up-rselenium-for-r)

1. Run docker pull selenium/standalone-chrome-debug in terminal (or cmd for windows)

5. Type 4445 on Ports. Click on the "plus" sign, type 5901 on the other input that will be created on Ports. After that, click Run.

library(RSelenium)

remDr <- remoteDriver(
  remoteServerAdd = "localhost",
  port = 4445L,
  browser = "chrome"
)
remDr$open()

-v /dev/shm:/dev/shm

# [How to connect to rselenium](https://docs.ropensci.org/RSelenium/articles/docker.html)

https://www.tightvnc.com/download.php

https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html


https://stackoverflow.com/questions/29861117/scraping-a-dynamic-ecommerce-page-with-infinite-scroll
#scroll down 5 times, waiting for the page to load at each time
for(i in 1:5){      
remDr$executeScript(paste("scroll(0,",i*10000,");"))
Sys.sleep(3)    
}

#get the page html
page_source<-remDr$getPageSource()

#parse it
html(page_source[[1]]) %>% html_nodes(".product-itm-price-new") %>%
  html_text()
  
# Docker Browser Images To Use

- selenium/standalone-chrome-debug,  Image ID: 6a3a9ed31627
- selenium/standalone-firefox-debug, Image ID: f5f64b86c7d6
