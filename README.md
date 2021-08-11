
## Initialization
```dart
flutter_bloc: ^1.0.0
```

```dart

```



## UI



```dart

import 'package:flutter/material.dart';
import '../data/weather_repository.dart';
import 'pages/weather_search_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
        builder: (context) => WeatherBloc(AltWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}


```



