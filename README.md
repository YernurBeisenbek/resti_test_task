# resti_test_task

A new Flutter project.

## Getting Started

# Resti Test Task

This is a simple News Feed App that allows users to scroll through posts and like them. The likes are stored locally on the device using SharedPreferences. The app follows Clean Architecture principles, uses Dependency Injection, and includes State Management and tests.

## Features

- Display a list of news posts fetched from a sample API.
- Like a post.
- Persist liked posts locally using SharedPreferences.

## Architecture

The app is structured following Clean Architecture principles:

- **Presentation Layer**: Contains the UI and state management logic.
- **Domain Layer**: Contains business logic and entities.
- **Data Layer**: Contains data sources and repositories.

## State Management

The app uses the Provider package for state management.

## Testing

The app includes both unit and widget tests:

- Unit tests for business logic.
- Widget tests for UI components.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:

   ```sh
   git clone git@github.com:YernurBeisenbek/resti_test_task.git
   cd resti_test_task
   git checkout master

