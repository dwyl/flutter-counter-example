<div align="center">

# `flutter-counter-tdd`

</div>

# _Why_? 🤷


The **_objective_** of the application 
that will be created is to explain 
**_step by step_** the creation of a Flutter application 
using the **_TDD_**.<br />



# _What_? 💭

The TDD is a **_method or approach_** used in programming 
where the objective is to write a **_test_** (a function, a class or method) 
so that it fails, to be added later only the code necessary for the test to pass.


> We have built a _small counter application_ 
to be understood by all beginners. 
To build this tutorial we use the TDD method which is used in several languages.
The result of this _tutorial_ is much **simpler** 
to understand and beyond the **step by step** has
the **complete code** of the application.


>To learn more about how TDD works and how it can be used, 
this repository has all the essential information: https://github.com/dwyl/learn-tdd

# _Who_? 👥

This tutorial is intended for all people who are _learning_
more about **_Flutter_** and who are looking 
to learn how to use the **_TDD correctly_**.
It was made for all **beginners** without previous _experience/knowledge_.

# _How_? ✅

Before creating a project, make sure you 
have installed Flutter and all the toolkits necessary
to create a Flutter application.
If you're _just_ starting out, 
please visit our [`learn_flutter`](https://github.com/dwyl/learn-flutter)]
repo to have detailed instructions to get your dev env properly setup
and have all the necessary extensions in Visual Studio installed.

In this tutorial we will be using Visual Studio
as our main IDE. This is mainly because 
it's much easier to bootstrap and
run an emulator to test our application.

## 1. Project setup

Let's kickstart our project. 
After you've installed VSCode and added the extensions,
click on `View > Command Pallete` and click.
This will prompt a text bot. Type `Flutter`
and choose the `Flutter: New Project` option.
Give the app name whatever you want. 
Note that this will affect the imports, so if you want 
to strictly follow with this tutorial, name it `counter_app`.

After this, a `counter_app` folder will be created.

```sh
cd counter_app
```

To write our tests, we are going to need to add
two packages. Open the `pubspec.yaml` file and
add the following lines to the `dev-dependency` section.

```yaml
equatable: ^2.0.5
shared_preferences: ^2.0.15
```

We are using [`equatable`](https://pub.dev/packages/equatable)
because it allows us to compare objects in a much easier manner,
without having to write boilerplate to compare their values
directly or without any overrides. 
If you are interested in how `equatable` works, 
check their documentation.

We are also adding [`shared_preferences`](https://pub.dev/packages/shared_preferences)
because it is needed to install `equatable`.

After adding these two lines to the `pubspec.yaml` file,
run the following command to download and install the dependencies.

```sh
flutter pub get
```

## 2. Structuring our project

After creating the Flutter project, 
let's two directories inside the `lib` folder 
(which will contain all the source code). 
Create the `domain` folder and then create the `presentation` folder.
Inside the `test` folder, create a `widget` and `unit` folder,
which will refer to the widget testing and unit testing
we will implement, respectively. 


## 3. Write the first tests and implement app

Since we know what are will *will do*, we can infer
that a class named `Counter` will probably be needed.
This class will hold the value of the counter. 

In order to perform the tests,
we must first `create a class with functions` - the `Counter` class.
These functions in the case of this project
are `increment` and `decrement`.

For that inside the `domain` folder, 
create a file called `counter.dart`.<br />

Inside the `counter.dart` file,
let's initialize the class.

```dart
import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  int value = 0;

  @override
  List<Object> get props => [value];
}
```
We will have a `value` that will start at 0 to `count` the numbers.
Additionally, the reason we implemented the `get props` 
function is because we are **extending** Equatable,
and it's needed to properly compare the object's values.

Inside the `unit` folder that is inside the `test`folder we have created,
create `counter_test.dart`. 
This will be used to create and run all the necessary `tests`
on the `Counter` class.

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
The `second test` will be used to check
if the value is being `incremented` and if it's
only being increased *one by one*.

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
If we run the `tests` using the `flutter test`, 
we'll see the test fail. This is expected, 
as the functions that were used in the tests aren't yet implemented.

To pass the tests, head over to the `counter.dart` file 
and add the `increment` and `decrement` functions. 

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

<img width="661" alt="test_pass" src="https://user-images.githubusercontent.com/17494745/201917161-ccbc3445-10d1-4eb2-8b03-9f50e9e6f8e0.png">

For our homepage, we will create a file inside the `presentation` folder
with the name `counter_page.dart`.
While we are at it, let's change `main.dart` to 
call this `counter_page` we will going to implement. 

```dart
import 'package:counter_app/presentation/counter_page.dart';
import 'package:flutter/material.dart';

// coverage:ignore-start
void main() {
  runApp(const MyApp());
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(title: 'Counter App Demo'),
    );
  }
}
```
The `main` function calls `MyApp`, 
which in turn sets up the `MateiralApp` that calls the
`CounterPage`, the same page we will now create. 
Do notice we are surrounding the `main()` function
with `coverage:ignore-start` and `coverage:ignore-end`
so test coverage will be properly run. 
The `main()` function is not usually testable, 
so we skip it.

All the settings in the appearance 
of our application will be made in the file `counter_page.dart`.
Change the file so it looks like the following.

```dart
import 'package:counter_app/domain/counter.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  Counter _counter = Counter();

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _counter.value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
```

Let's go through what we just wrote.
We are using a **stateful widget**, which has a `Counter` object
in its state. 
We add the `_incrementCounter()` and `_decrementCounter()` functions
which in turn change the state of the widget by
incrementing/decrementing the counter. 

In the `build()` function, we use the `Center` widget
to center the contets of the page. 
Inside this, we add a `Column`
that centers the contents using `MainAxisAlignment.center`.
The contents of this `Column are three-fold:
- a `Text` string 'You have pushed the button this many times:'
- a `Text` that prints the `counter` value
- a `Row` that has two `FloatingActionButton`s. 
One button increments and the other decrements the counter.

The application is complete.
In Visual Studio, on the bottom bar,
click on the device you want to emulate.
We are going to use an iPhone 14 Pro Max emulator
to showcase the application. 

After choosing the device, click `F5` or 
`Run > Start Debugging`. 
This will build the app and run it in the emulator.

Your app should now look like this :tada:.


| ![initial](https://user-images.githubusercontent.com/17494745/201922142-08061339-e1e4-425e-ba61-afae0a4fa251.png)  | ![increment](https://user-images.githubusercontent.com/17494745/201922084-640bcd5c-7bda-4c02-b5e5-ccf99d277861.png) | ![decrement](https://user-images.githubusercontent.com/17494745/201922179-6ca5d66c-727d-499a-9def-31e124fa601e.png) |
|:---:|:---:|:---:|

# Test coverage 🧪





### Relevant Reading
- https://dart.dev/guides/testing
- https://flutter.dev/docs/testing
- https://medium.com/learnfazz/common-mistakes-in-tdd-and-tdd-in-flutter-2bf682071036
- https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/
