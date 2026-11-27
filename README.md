# bear_kit

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

The missing pieces of Flutter. Helper widgets, tools and extensions for things the SDK doesn't give
you out of the box:

- no styling of their own, so they work with any design
- less boilerplate: no timers, controllers or listeners to wire up by hand
- simple API, no architecture lock-in

Part of the **bear.** family, together with [bear_ui](https://github.com/dmisiek/bear_ui).

## Installation

Once it's on [pub.dev](https://pub.dev/packages/bear_kit):

```sh
dart pub add bear_kit
```

Until then, pull it from git:

```yaml
dependencies:
  bear_kit:
    git: https://github.com/dmisiek/bear_kit.git
```

## PeriodicBuilder

Rebuilds part of the UI every `duration`, for example a label showing how long ago something
happened. The timer starts and stops with the widget, so there's nothing to clean up by hand.

```dart
PeriodicBuilder(
  duration: const Duration(minutes: 1),
  builder: (context) {
    return Text(formatRelativeTime(createdAt));
  },
);
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
