<div align="center">

# `flutter-counter-tdd`

</div>

# _Why_? 🤷


The **_objective_** of the application 
that will be created is to explain 
**_step by step_** the creation of an application 
using the **_TDD_**.<br />



# _What_? 💭

The TDD is a **_method or approach_** used in programming 
where the objective is to write a **_test_** (a function, a class or method) 
so that it fails, to be added later only the code necessary for the test to pass.


> We have built a _small counter application_ 
to be understood by all beginners. <br />
To build this tutorial we use the TDD method which is used in several languages.
The result of this _tutorial_ is much **simpler** 
to understand and has beyond the **step by step** has
the **complete code** of the application.


>To learn more about how TDD works and how it can be used, this repository has all the essential information: https://github.com/dwyl/learn-tdd

# _Who_? 👥

This tutorial is intended for all people who are _learning_
more about **_Flutter_** and who are looking 
to learn how to use the **_TDD correctly_**.
It was made for all **beginners** without previous _experience/knowledge_.

# _How_? ✅

To realize any application in Flutter we obviously have to create a **_new project_** in Flutter.<br />

### Steps to create a new project in Flutter (Visual Studio)

First it is necessary to **_install_** the visual studio code (https://code.visualstudio.com/docs/?dv=osx). <br />
Then we have to **_download_** the extensions that we will use in our application.
Inside Visual Studio we have to go to the extensions icon and look for **_Flutter and Dart_**.

![Extensions](https://user-images.githubusercontent.com/27420533/76661655-e7a1b380-6573-11ea-8f7e-4cdd15da6832.png)

![Flutter_Dart_extensions](https://user-images.githubusercontent.com/27420533/76661748-1c156f80-6574-11ea-9879-34bc149bad6d.png)

Now you need to go to the visual studio and click **_Cmd+Shift+P_**.<br />
Then select **_Flutter: New Project_** option.

![Flutter_project](https://user-images.githubusercontent.com/27420533/76662067-dc02bc80-6574-11ea-86fb-001a469a25e6.png)


Then enter the name of the **_Project_**.


![Project_Name](https://user-images.githubusercontent.com/27420533/76662343-9bf00980-6575-11ea-95ab-b22578cbe019.png)

Then it is necessary to select the folder where the project will be created.

Then just **_click OK_** to create the project.
Right after that the visual studio will restart and the following command will appear in the bottom right corner.

![Command_create_project_flutter](https://user-images.githubusercontent.com/27420533/76662484-fd17dd00-6575-11ea-8c3f-7fea184c3b22.png)


### Steps to build a basic App in Flutter following TDD best pratices

After creating the new project in Visual Studio we start by `changing the project files`.<br />
Inside the `lib folder` create the `Domain` folder and then create the `Presentation` folder.<br />
Inside the `test folder` we create the same folders.

#### Add Packages to pubspec.yaml file

Then we start by adding the packages we will need to perform the application inside the file `pubspec.yaml`.<br />
For this project we will use the `Equatable` package and the `shared_preferences` package.

```dart
dependencies:
  flutter:
    sdk: flutter

  equatable: ^1.1.0

  shared_preferences: 0.5.6+3

```

Equatable package: https://pub.dev/packages/equatable <br />
Shared_preferences: https://pub.dev/packages/shared_preferences


### Write the First tests

In order to perform the tests we must first `create a file with a function`.<br />
This function in the case of this project is the function to `increment` and `decrement`.<br />

For that inside the `Domain` folder, create a file called `counter.dart`.<br />

Inside the `counter.dart` file you need to initialize the class.

```dart
import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  int value = 0;

  @override
  // TODO: implement props
  List<Object> get props => [value];
}
```
We will have a `value` that will start at 0 to `count` the numbers.<br />

Inside the `Domain` folder that should be inside the `test folder` we have created a file called `counter_test.dart` this will be used to create and run all the necessary `tests` for the application to work.<br />

Our `first test` will be for the initial value to start at 0.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app_tdd/Domain/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });
   });
}
```
The `second test` will be used to see if the value is being `incremented` and if it is only being increased `one by one`.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app_tdd/Domain/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });
    
     test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);

    });
    
   });
}
```

And the `third test` will be to know if clicking on the decrement button decreases the value and if only is taken out one by one.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app_tdd/Domain/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);

    });

    test('value should be decremented', () {
      final counter = Counter();

counter.decrement();

      expect(counter.value, -1);


    });
  });
}
```
If we run the `tests` now they'll `fail`.

![tests_fail](https://user-images.githubusercontent.com/27420533/77262834-73ab8d80-6c8e-11ea-93bd-76aa248d65eb.png)


To pass the tests we have to go to the `counter.dart` file and add the `increment` and `decrement` functions. 

```dart
import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  int value = 0;


  increment() => value++;


  decrement() => value--;



  @override
  // TODO: implement props
  List<Object> get props => [value];
}
```

This way the tests will `pass`.

![tests_pass](https://user-images.githubusercontent.com/27420533/77265469-b1131980-6c94-11ea-97f3-85f33c5e02e7.png)

For our homepage we will `create` a file inside the `Presentation` folder with the name `counter_page.dart`.<br />
In our `main.dart` file we will have to give the information that we will use as initial page the file we create now.<br />

```dart
import 'package:flutter/material.dart';
import 'package:counter_app_tdd/Presentation/counter_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Counter App Example',
    theme: ThemeData(
      primaryColor: Colors.red.shade800,
      accentColor: Colors.red.shade600,
    ),
    debugShowCheckedModeBanner: false,
    home: CounterPage(),
  );
}
}
```

All the settings in the appearance of our application will be made in the file `counter_page.dart`.

```dart
import 'package:counter_app_tdd/Domain/counter.dart';
import 'package:flutter/material.dart';


class CounterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$value',
              style: TextStyle(fontSize:80.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              FloatingActionButton(
              onPressed:(counter.increment()){
              },
              child: Icon(Icons.add),
              tooltip: 'Increment',
              ),
              SizedBox(width: 20.0),
              FloatingActionButton(
              onPressed: (counter.decrement()){
              },
              child: Icon(Icons.remove),
              tooltip: 'Decrement',
              ),
              
              ],)
            ],
          )));
  }

}
```

We import our `counter.dart` class so we can use the `implement` and `decrement` function.

This will be the `final result` of the application.


<div align="center">


![App_Work_0](https://user-images.githubusercontent.com/27420533/78388610-34a80100-75d9-11ea-879f-7984ebbef8cf.png) 
![App_Work_1](https://user-images.githubusercontent.com/27420533/78388614-383b8800-75d9-11ea-9819-88e4da46f417.png) ![App_Work_2](https://user-images.githubusercontent.com/27420533/78388620-3a9de200-75d9-11ea-8116-f99e2ec896fa.png)

</div>


### Relevant Reading
- https://dart.dev/guides/testing
- https://flutter.dev/docs/testing
- https://medium.com/learnfazz/common-mistakes-in-tdd-and-tdd-in-flutter-2bf682071036
- https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/
