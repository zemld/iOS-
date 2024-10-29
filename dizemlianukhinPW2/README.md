# Ответы на вопросы из домашнего задания №2

## Землянухин Денис

### Вопрос 1: "Какие проблемы поддалкивают нас не использовать Storyboard в реальных проектах?"

Использование Storyboard в реальных проектах может привести к следующим проблемам:

1. **Конфликты при слиянии**: Storyboard файлы являются большими XML файлами, что делает их трудными для слияния при работе в команде.
2. **Производительность**: Большие Storyboard файлы могут замедлить Xcode, особенно при работе с большими проектами.
3. **Масштабируемость**: Сложно поддерживать и масштабировать большие Storyboard файлы, так как они могут стать громоздкими и трудными для навигации.
4. **Ограниченная гибкость**: Storyboard ограничивает гибкость в настройке пользовательского интерфейса, особенно при создании динамических или сложных интерфейсов.

### Вопрос 2: "Что делает код на строчках 25 и 29?"

Сам код выглядит так:

```swift
private func configureTitle() {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.text = "WishMaker"
    title.font = UIFont.systemFont(ofSize: 32)

    view.addSubview(title)
    NSLayoutConstraint.activate([
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
    ])
}
```

25-ая строчка выглядит так:

```swift
title.translatesAutoresizingMaskIntoConstraints = false
```

Изменение значения свойства на `false` позволяет использовать автоматическую разметку на экране телефона с корректно заданными ограничениями компоновки элементов. То есть благодаря этой строчке можно написать

```swift
NSLayoutConstraint.activate([
    title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
])
```

Что позволит разместить заголовок там, где мы хотим. И это также будет гарантировать, что его положение никак не изменится в последствии.

а 29-ая:

```swift
view.addSubview(title)
```

Добавляет в конец списка `Subview` `title`. Благодаря этому заголовок будет отрисован поверх всех остальных subview данного `view`.

### Вопрос 3: "Что есть safeAreaLayoutGuide?"

`safeAreaLayoutGuide` определяет часть экрана, которая не будет затемнена и перекрыта панелями навигации, вкладок, инструментов и другими родительскими view.

### Вопрос 4: "Что такое `[weak self]` в строке `sliderRed.valueChanged = { [weak self] value in self?.view.backgroundColor = ...}` и почему это важно?"

`[weak self]` в данном контексте - захват списка в замыкании. Он используется для предотвращения сильных ссылок на `self` внутри замыкания. Это нужно для предотвращения зацикливания и утечек памяти.

### Вопрос 5: "Что означает `clipToBounds`?"

Это свойство позволяет subview принять размеры view (если значение свойства `true`). Если же значение свойства `false`, то те subview, размеры которых вылезают за границы view, не будут прикреплены к view.

### Вопрос 6: "Какой тип имеет `valueChanged`? Что здесь `Void`, а что `Double`?"

`valueChanged` имеет тип функции, которая принимает значение типа `Double`, а возвращает либо `Void`, либо `nil`.
