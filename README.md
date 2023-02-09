## flutter_material_ui

A Flutter plugin for implement Material UI design for widget.
Let's start...

## Getting started

To use this plugin, add flutter_material_ui as a dependency in your pubspec.yaml file.
####Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_material_ui/flutter_material_ui.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MButton.defaultBtn(
            child: Text('Open'),
            onPressed: () {
              print('Thank you');
            },
          ),
        ),
      ),
    ),
  );
}
```

## Our Contributors
[//]: contributor-faces
<div style="display:flex;position:relative">
  <a href="https://github.com/md-golamrabbani">
    <img src="https://avatars.githubusercontent.com/u/39708967" title="Md. Golam Rabbani" width="70" height="70" style="border-radius: 100%">
  </a>
  <a href="https://github.com/ShekharUllah06">
    <img src="https://avatars.githubusercontent.com/u/20273137" title="Mia Abdullah Shekhar" width="70" height="70" style="border-radius: 100%">
  </a>
  <a href="https://github.com/AshiqueImran">
    <img src="https://avatars.githubusercontent.com/u/23379542?v=4" title="Md. Ashiq Imran" width="70" height="70" style="border-radius: 100%">
  </a>
</div>
