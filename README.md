# flutter_model

A basic architecture for all the Flutter's projects.
This architecture should be the initial code of every Flutter applications.

This means that it is meant to be updated in the futur.

## The app

The app represents bunch of functionnalities that most mobile applications should have :

* Login / Connected views (with the authentified / unauthentified navigation's logic)
* A web service call to retrieve a list of posts
* A detail for each post
* A Pull to refresh of the list
* A "Favorites" global logic

## The Architecture

The architecure is based on Bloc pattern and especially the `flutter_bloc` implementation.

`flutter_bloc`'s documentation : https://felangel.github.io/bloc/#/gettingstarted

The idea is to separate all the logic in Blocs.
These blocs will receive Events from Widgets and, asynchronously, will return States.

Widgets listen for states and show a view based on state changes.

This solution of Global State management has been chosen because of its really clean structure and the fact that all Events and States may be listenend for debug.

## How to launch - dealing with environments, flavors and schema

### What is the difference between environments and flavors ?

`Environments` represent the different `main` files in the Flutter project.
Each of these main file has its specific AppConfig Inherited Widget in order to put the correct variables for the environment.

Sometimes, when using Firebase google-service.json files for example, you will also need to add specific files for specific environments.
That is where flavors and schema ar used.

`On Android`
You will have to put the file in the appropriate directory under `android/app/src/` :

* dev
* preprod
* prod

Then, when running or building your app with the correct command line, the right file will be taken.

### How do `run` or `build` the app

The app has 3 different environments :

* dev
* preprod
* prod

These have 3 different `main` dart's files :

* main_dev
* main_preprod
* main_prod

#### Android

In order to run the one environment you want, you will have to use the `-t` (for target) argument and also the `--flavor` argument for the desired flavor:

* ```flutter run -t lib/main_dev.dart --flavor dev```
* ```flutter run -t lib/main_preprod.dart --flavor preprod```
* ```flutter run -t lib/main_prod.dart --flavor prod```

In order to `build` Apk , the arguments `-t` and `--flavor` are also needed:

* ```flutter build apk -t lib/main_dev.dart --flavor dev```
* ```flutter build apk -t lib/main_preprod.dart --flavor preprod```
* ```flutter build apk -t lib/main_prod.dart --flavor prod```
