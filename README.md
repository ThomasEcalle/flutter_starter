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

## How to launch - dealing with environments

The app has 3 different environments :

* dev
* preprod
* prod

These have 3 different `main` dart's files :

* main_dev
* main_preprod
* main_prod

In order to run the one environment you want, you will have to use the `-t` (for target) argument like this:

* ```flutter run -t lib/main_dev.dart```
* ```flutter run -t lib/main_preprod.dart```
* ```flutter run -t lib/main_prod.dart```

In order to `build` Apk or Ipa, the argument `-t` is also needed:

* ```flutter build apk -t lib/main_dev.dart```
* ```flutter build apk -t lib/main_preprod.dart```
* ```flutter build apk -t lib/main_prod.dart```
