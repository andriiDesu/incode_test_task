incode_test_task is a test project for the Incode Group job application

## Table of Contents

- [Features](#features)

- [Installation](#installation)

    - [Prerequisites](#prerequisites)

    - [Clone the Repository](#clone-the-repository)

    - [Configuration](#configuration)

    - [Build and Run](#build-and-run)

- [Usage](#usage)

## Features

- A list of Harry Potter characters, with their details
- Ability to guess characters' affiliation with their respective houses
- Tracking of your guesses, with an opportunity to try again
- A button to reset your progress

## Installation

Follow these steps to install and run incode_test_task on your system.

### Prerequisites

Before you begin, ensure you have the latest version of Flutter installed:

- [Flutter](https://docs.flutter.dev/release/archive)

### Clone the Repository

1. Open your terminal or command prompt.

2. Use the following command to clone the repository:

   git clone https://github.com/andriiDesu/incode_test_task.git

### Configuration

1. Change your working directory to the cloned repository with the command:
   cd incode_test_task

2. Get your dependencies with the command:
   flutter pub get

3. Run code generation, to ensure that models are up to date with the command:
   dart run build_runner build

4. Run Realm code generation to build database models:
   dart run realm generate

5. Generate localization files:
   flutter gen-l10n

### Build and Run

1. Connect your device or start an emulator.

2. To build and run the project, use the following command:
   flutter run

This will build the project and install it on your connected device or emulator.

## Usage

1. Press on the corresponding house's button, that you think the character is affiliated with
2. Pull down to refresh the character
3. Press 'Reset' button on the top right corner in order to reset your recorded guesses
4. Press the 'List' button on the bottom navigation bar to navigate to a list of guesses
5. Press on the character in the list to open their respective Details page
6. Depending on your guess, character details will be displayed

