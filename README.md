# flutter_starter

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

Sometimes, when using `Firebase google-service.json` files for example, you will also need to add specific files for specific environments.
That is where flavors and schemas ar used.

#### Android - Firebase (and other)

You will have to put the file in the appropriate directory created under `android/app/src/` :

* dev
* preprod
* prod

> You have to create this directories yourself.

Then, when running or building your app with the correct command line, the right file will be taken.

#### iOS - Schemas

The only thing you will have to do is to manually set the right bundle identifiers for your schemas.

Open XCode and:

* Click on Runner `TARGETS`
* Go on `Build Settings`
* Select `combined` and `all`
* Search for `Product Bundle Identifier`
* You should see the list of each bundle identifier for each schema
* You jsut have to modify the:
    * Debug-dev's identifier -> adding `.dev` at the end for example
    * Debug-preprod's identifier -> adding `.preprod` at the end for example
    * Release-dev's identifier -> adding `.dev` at the end for example
    * Release-preprod's identifier -> adding `.preprod` at the end for example

#### iOS - Firebase

On iOS, ther is one more step in order to add Firebase to your schemas.

Open your XCcode and you will have to :

##### 1. Create Firebase folders

* Create a `New Group without folder` nammed Firebase in the `Runner` folder
* Create 3 `New Group` nammed `dev`, `preprod` and `prod`
* Copy and Paste the right `GoogleService-Info.plist` in the appropriate new folder

##### 2. Create new Run Script

* Select Runner `TARGETS`
* Go to `Build Phases`
* Click on the "+" button and : `New Run Script Phase`
* Call it as you want, for example: `Firebase Setup`
* In the shell script, copy and paste this code :

```
if [ "${CONFIGURATION}" == "Debug-prod" ] || [ "${CONFIGURATION}" == "Release-prod" ] || [ "${CONFIGURATION}" == "Release" ]; then
cp -r "${PROJECT_DIR}/Runner/Firebase/prod/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Production plist copied"

elif [ "${CONFIGURATION}" == "Debug-preprod" ] || [ "${CONFIGURATION}" == "Release-preprod" ]; then

cp -r "${PROJECT_DIR}/Runner/Firebase/preprod/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Preprod plist copied"

elif [ "${CONFIGURATION}" == "Debug-dev" ] || [ "${CONFIGURATION}" == "Release-dev" ] || [ "${CONFIGURATION}" == "Debug" ]; then

cp -r "${PROJECT_DIR}/Runner/Firebase/dev/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Development plist copied"
fi
```

> Explanations :
> This code will, depending on the asked configuration, copy the right GoogleService-Info.plist from your directories and paste it in the Runner directory

> WARNING !
> Do these steps only if you really have (and need) the correponding Firebase's GoogleService-Info.plist files !
> If not, the new script you have just created will throw an error and you will not be able to compile your project.



### How do `run` or `build` the app

The app has 3 different environments :

* dev
* preprod
* prod

These have 3 different `main` dart's files :

* main_dev
* main_preprod
* main_prod

In order to run the one environment you want, you will have to use the `-t` (for target) argument and also the `--flavor` argument for the desired flavor:

* ```flutter run -t lib/main_dev.dart --flavor dev```
* ```flutter run -t lib/main_preprod.dart --flavor preprod```
* ```flutter run -t lib/main_prod.dart --flavor prod```

In order to `build` the Apk or IPA, the arguments `-t` and `--flavor` are also needed:

* ```flutter build <apk or ios> -t lib/main_dev.dart --flavor dev```
* ```flutter build <apk or ios> -t lib/main_preprod.dart --flavor preprod```
* ```flutter build <apk or ios> -t lib/main_prod.dart --flavor prod```

