# BMI Calculator

**A small Flutter app that calculates your BMI and keeps a history of past results in a local SQLite database.**

![Flutter](https://img.shields.io/badge/Flutter-3.35-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9-0175C2?logo=dart)
![SQLite](https://img.shields.io/badge/sqflite-local_storage-003B57?logo=sqlite)

Built in January 2026 as a course exercise and extended afterwards. The interface is in Portuguese.

## Features

- Enter name, weight and height to get the BMI and its category (from *Magreza Grave* to *Obesidade Grau III*)
- Every result is saved with its date in a local history
- Swipe a history item to delete it
- The name is remembered between sessions with `shared_preferences`

## What this project demonstrates

- **Versioned SQLite migrations.** The schema lives in a map of numbered scripts, and `openDatabase` runs them in order: `onCreate` applies all of them, `onUpgrade` applies only the ones newer than the installed version. Adding a table is one new entry in the map. See [`database_sqlite.dart`](lib/repository/database_sqlite.dart).
- **A repository between the UI and the database.** Screens call `HistorySqliteRepository`, never `sqflite` directly.
- **Dart 3 relational patterns.** The BMI category is a `switch` over ranges (`case >= 18.5 && < 25`) instead of an `if` chain. See [`calcular_imc.dart`](lib/service/calcular_imc.dart).
- **Two kinds of local storage, each for its job:** SQLite for the history (a list of records) and `shared_preferences` for a single value (the name).

## Known issues and next steps

I keep these public on purpose:

- [#2](../../issues/2) No tests yet: boundary tests for each BMI category are planned.
- [#3](../../issues/3) Invalid input is not rejected: a height of zero returns *Obesidade Grau III* instead of an error.

## Getting started

```bash
git clone https://github.com/felipepcmourao/imc_calculator.git
cd imc_calculator
flutter pub get
flutter run
```

Requires Flutter 3.35 or later.

## Collaboration

A second developer contributed commits to this repository, including a merge conflict resolution.

## Author

**Felipe Mourão**, self-taught Flutter developer based in Porto, Portugal.
[GitHub](https://github.com/felipepcmourao) · [LinkedIn](https://www.linkedin.com/in/felipepcmourao/)

My main project is [FilamentOS](https://github.com/felipepcmourao/filament_os).
