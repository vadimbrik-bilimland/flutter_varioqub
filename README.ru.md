# flutter_varioqub

Flutter плагин для сервиса A/B тестирования от Yandex Metrica - Varioqub
Аналог Firebase Remote Config

## Локализация

[English](https://github.com/smenateam/flutter_varioqub/blob/master/README.md)

## Плагин

Плагин основан на [Android/IOS SDK](https://yandex.ru/support2/varioqub-app/ru/) AppMetrica Varioqub и использует функционал SDK

Весь функционал описан в example
### Инициализация
```await Varioqub.init(apiKey:'appmetrica.XXXXXXX');``` - используется для инициализации Varioqub, где XXXXXXX - числовой id AppMetrica проекта

### Default значения
```await Varioqub.setDefault(
      defaultMap: {

      },
    );
```
используется для назначения default значений на случай если приложение не получило конфигов(разрыв интернет соединения и т.д.)

### Получение конфигов
```await Varioqub.fetchConfig();``` - используется для получения конфигов

### Активация конфигов
```await Varioqub.activateConfig();```

### Получение конфигов
```Varioqub.getString('key':'');``` - получение строкового значения

```Varioqub.getBool('key':'');``` - получение булева значения

```Varioqub.getDouble('key':'');``` - получение значения вещественного типа

```Varioqub.getLong('key':'');``` - получение целочисленного значения

## Проблемы

Мы не учли аналитику в текущем состоянии плагина - адаптеры нулевые, будем рады вашей поддержке проекта
