# MemeOracle
The meme predicting fortune teller

Predicting viral memes for the average person can be such a challenge. Fear not! Throw out that doom scrolling! My app provides you the knowledge without the symptoms that come with staring at your phone screen all day. Download Meme Oracle and you can see clearly again! All it takes is the click of a button and you can feel culturally cooked!

### Overview

The goal of this project is to develop an application that can predict meme trends by scraping and analyzing posts from platforms such as Reddit and Twitter. This app will gather data from specific subreddits and tweets, process the information and use machine learning to detect emerging trends.

### Technical Insight

Programming language: C# <br />
<br />
IDE: Visual studio <br />
<br />
API’s / Libraries: <br />
* Reddit API - Scrapes posts from target subreddits
* Microsoft.ML & TensorFlow.NET - Machine learning models for trend prediction
* (future update) Twitter API V2 - Since twitter restricts scraping, this is used, it allows fetching tweets, user data, and trends legally.
* (Future update) TweetInvi Nuget Package (for easy C# integration)

### Core Features

* Subreddit scraping extracts posts from specific subreddits, including, “dankmemes” and “memecoinmoonshots”
* Filters posts up to a week old to keep content fresh.
* Data Processing
* Machine Learning Analysis uses Microsoft.ML &TensorFlow.NET to train models on meme popularity trends.
* Predicts the likelihood of a meme trend going viral.
* User interface & Experience


### Challenges and Potential Hurdles

* Authentication issues: Currently in the process of this one by attempting to connect to Reddit’s API. 
* Rate Limiting: Needs to handle API request limits and introduce delays if necessary.
* Machine learning accuracy

### Future Updates:

* Expand to Twitter and/or Instagram to include a wider dataset.
* Allow users to create their own meme and have the app predict its potential popularity.
* Random meme trend generator.



