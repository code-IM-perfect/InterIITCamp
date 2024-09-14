# InterIIT App Dev Recruitment Task

This is a normal flutter project, and can be built by
```sh
flutter build apk --split-per-abi
```

Before building you would need to put your `weatherapi.com` API key in `lib/pages/dynamic_data.dart` (line 75)

In the **image page**, the animated webp is being fetched from giphy.

In the **Static data page**, using an API the app is fetching some dummy data in JSON format and rendering it on the page. The number of enteries being fetched can be varied. Doing this would also refresh the current enteries and fresh random entries will be displayed.

In the **weather page**, the app is refreshing its data every 1 minute via the Timer object provided by the `dart/async` package.

I could not complete implementing the notifications part.