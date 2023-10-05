# flutter_varioqub

Flutter plugin for A/B testing service from Yandex Metrica - Varioqub
Similar to Firebase Remote Config

## Localization

[Русский](https://github.com/smenateam/flutter_varioqub/blob/master/README.ru.md)

## Plugin

The plugin is based on [Android/IOS SDK](https://yandex.ru/support2/varioqub-app/ru/) AppMetrica Varioqub and uses SDK functionality

All functionality is described in example
### Initialization
```await Varioqub.init(apiKey:'appmetrica.XXXXXXX');``` - used to initialize Varioqub, where XXXXXXX is the numeric id of the AppMetrica project

### Default values
```await Varioqub.setDefault(
       defaultMap: {

       },
     );
```
used to assign default values in case the application has not received configs (internet connection disconnected, etc.)

### Getting configs
```await Varioqub.fetchConfig();``` - used to get configs

### Activating configs
```await Varioqub.activateConfig();```

### Getting configs
```Varioqub.getString('key':'');``` - getting a string value

```Varioqub.getBool('key':'');``` - getting a Boolean value

```Varioqub.getDouble('key':'');``` - getting a value of a real type

```Varioqub.getLong('key':'');``` - getting an integer value

## Problems

We did not take into account analytics in the current state of the plugin - the adapters are zero, we will be glad to see your support for the project