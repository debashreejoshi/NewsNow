# NewsNow

NewsNow is a news app that displays a list of articles fetched from an API. The app uses URLSession to make network requests to the API and displays the data in a UITableView.

The NewsNow app includes several additional features, including:
* Displaying the date and publisher information for each article in addition to the title and description.
* Caching images from article thumbnails to improve performance and reduce data usage.

|List|Detail|
|-|-|
|![List](https://user-images.githubusercontent.com/5268412/233980150-68535160-bd08-40c8-98e5-81de0600a3bf.png)|![DetailVIew]()![Detail](https://user-images.githubusercontent.com/5268412/233980403-6e7112e8-7280-4c18-a012-a0eba90cc90f.png)|

### Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
You will need a Mac running macOS 10.15 or later with Xcode 12 or later installed. You will also need a stable internet connection.

### Installing
To install the project, first clone this repository to your local machine.

``` git clone https://github.com/debashreejoshi/NewsNow.git ```

Then, navigate to the project directory and open the NewsNow.xcodeproj file.

```
cd NewsNow 
open NewsNow.xcodeproj
```
You can now build and run the app from Xcode.

### Architecture
The NewsNow iOS app follows a model-view-viewmodel (MVVM) architecture pattern. The app is divided into several classes, each with a specific role in the app's functionality:
* ArticlesViewController: The view controller responsible for displaying a list of articles and handling user interaction events.
* ArticlesViewModel: The view model responsible for retrieving data from the API and formatting it for display in the view.
* ArticlesRouter: The router responsible for handling navigation and presenting alerts to the user.
* ArticleCellViewModel: The view model responsible for formatting data for display in a table view cell.
* ArticleTableViewCell: The table view cell responsible for displaying information about a single article.
* WebViewController: The view controller responsible for displaying a web view with the content of an article.

### Third-Party Libraries
The following third-party library was used in the NewsNow app:
* SDWebImage: Used for asynchronously loading and caching images from URLs.
SDWebImage was chosen because it provides an easy way to download and cache images, which improves the app's performance.

### Running the Tests
NewsNow includes unit tests and UI tests to ensure the app is functioning as expected. To run the tests, select the NewsNow scheme in Xcode and press the Test button.

#### Unit Tests
The unit tests cover the app's data model and network requests. They can be found in the NewsNowTests directory. Here are the tests that are included:
* APIServiceTests: Tests the APIService class that is responsible for fetching articles from the API.
* ArticleTableViewCellTests: Tests the ArticleTableViewCell class that is responsible for displaying articles in the table view.
* ArticlesViewControllerTests: Tests the ArticlesViewController class that is responsible for displaying articles in a table view and fetching articles from the API through its view model.

#### UI Tests
The UI tests cover the app's user interface and interactions. They can be found in the NewsNowUITests directory. Here are the tests that are included:
* ArticlesViewControllerUITest: Tests the ArticlesViewController class that is responsible for displaying the list of articles.

### Built With
* Xcode - The IDE used to build the app
* Swift - The programming language used to write the app
* SDWebImage - A library used to load and cache images from the web

### License
This project is licensed under the MIT License - see the LICENSE.md file for details.
