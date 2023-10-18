## sondv package

Package includes utilities during working at my company

## Getting started

### Depend on it
```dart
dependencies:
  sondv: any
```
#### Widgets
``` 
value: double
```
- Gap(dimension, child)
- GapH(height, child)
- GapW(width, child)

#### Dialogs
- ```Future<bool>``` showConfirmAction()
- ```Future<String?>``` showConfirmInputDialog()
- ```void``` showMessageDialog()
- ```void``` showProcessingDialog()

#### Utils
- Logs
  - ```void``` showLog(dynamic object, {String flags = "App Logs"})
  - ```void``` showLogWithoutTime(dynamic object, {String flags = "App Logs"})
- Navigator
  - ```Future<T?>``` push()
  - ```void``` pop()
  - ```void``` popToRoot()
  - ```Future<T?>``` pushReplacement()
  - ```Route\<T>``` defaultPage()
- SnackBar
  - ```void``` showSnackBar()
- Validator
  - ```String?``` validateValueIsEmpty(String? value, {String errorMessage = 'This field is required',})
