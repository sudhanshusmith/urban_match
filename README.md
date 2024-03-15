# Urban Match

Urban Match is a Flutter app that allows you to browse public repositories on GitHub and view their latest commits.

## Features

- It Browse public repositories from the FreeCodeCamp GitHub account.
- Show the details of  the latest commit message for each repository.
- Displays information such as author name, email, and commit date within each repository.

## Installation

1. Clone the repository:

    ```bash
    git clone <repository_url>
    ```

2. Navigate to the project directory:

    ```bash
    cd urban_match
    ```

3. Set your Github Token:
     
    ```bash
    # go to lib/github_service.dart and in the below lines you have to replace <your_token> with your actual github authorization token generated
    static const userHeader = {"authorization": "token <your_token>"};
    ```

4. Install dependencies:

    ```bash
    flutter pub get
    ```

5. Run the app:

    ```bash
    flutter run
    ```

## Usage

- Upon launching the app, you will see a list of public repositories from the FreeCodeCamp GitHub account.
- Each repository will display its name along with the latest commit details.
- Latest commit details contain commit message, author name, author email & committed at.

## Working Screenshots

### Final State
#### It connects to the GitHub API to retrieve the list of public repositories. Currently, it shows public repositories of freeCodeCamp.
<img src="https://github.com/sudhanshusmith/urban_match/blob/main/images/final%20state.jpg" alt="Final State" width="200"/>


### Loading State
#### Once the list has been populated, it starts retrieving information about the last commit for each repository. It ensures that the list is scrollable while data is loading.
<img src="https://github.com/sudhanshusmith/urban_match/blob/main/images/loading%20state.jpg" alt="Async Loading State" width="200"/>



## Dependencies

- [http](https://pub.dev/packages/http): A Flutter package for making HTTP requests.

## Folder Structure

```
urban_match/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── github_service.dart
│   └── repository_list.dart
└── pubspec.yaml
```


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://opensource.org/licenses/MIT)

