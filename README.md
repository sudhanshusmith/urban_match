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


