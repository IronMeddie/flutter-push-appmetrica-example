import 'dart:async';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:appmetrica_push_plugin/appmetrica_push_plugin.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

AppMetricaConfig get _config =>
    const AppMetricaConfig("API_KEY",
        logs: true,
        sessionTimeout: 10,
    );

Future<void> main() async {
  AppMetrica.runZoneGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    AppMetrica.activate(_config);
    AppMetricaPush.activate();
    runApp(const MyApp());
    AppMetrica.reportEventWithJson("eventWithParams",
        "{\"Param1\":\"123456\", \"Param2\":\"param2 value\"}");
    purchase();
    revenue();
  });
}

void showScreen() {
  Map<String, String> payload = {
    "configuration": "landscape",
    "full_screen": "true",
  };
  // Creating a screen object.
  ECommerceScreen screen = ECommerceScreen(
      name: "ProductCardActivity", // Optional.
      searchQuery: "даниссимо кленовый сироп", // Optional.
      payload: payload, // Optional.
      categoriesPath: ["Акции", "Красная цена"] // Optional.
  );
  ECommerceEvent showScreenEvent = ECommerce.showScreenEvent(screen);
  // Sending an e-commerce event.
  // AppMetrica.getReporter("Testing API key").reportECommerce(showScreenEvent);
}

void showProductCard() {
  Map<String, String> payload = {
    "configuration": "landscape",
    "full_screen": "true"
  };
// Creating a screen object.
  ECommerceScreen screen = ECommerceScreen(
      name: "ProductCardActivity", // Optional.
      searchQuery: "даниссимо кленовый сироп", // Optional.
      payload: payload, // Optional.
      categoriesPath: ["Акции", "Красная цена"] // Optional.
  );
  ECommerceAmount amount =
  ECommerceAmount(amount: Decimal.parse('4.53'), currency: "USD");
// Creating an actualPrice object.
  ECommercePrice actualPrice =
  ECommercePrice(fiat: amount, internalComponents: [
    // Optional.
    ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
    ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
    ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
  ]);

// Creating an originalPrice object.
  ECommercePrice originalPrice = ECommercePrice(
      fiat: ECommerceAmount(amount: Decimal.parse('5.78'), currency: "USD"),
      internalComponents: [
        // Optional.
        ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
        ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
        ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
      ]);
// Creating a product object.
  ECommerceProduct product = ECommerceProduct(
      sku: "779213",
      name: "Продукт творожный «Даниссимо» 5.9%, 130 г.",
      // Optional.
      actualPrice: actualPrice,
      // Optional.
      originalPrice: originalPrice,
      // Optional.
      promocodes: ["BT79IYX", "UT5412EP"],
      // Optional.
      payload: payload,
      // Optional.
      categoriesPath: ["Продукты", "Молочные продукты", "Йогурты"] // Optional.
  );

  ECommerceEvent showProductCardEvent =
  ECommerce.showProductCardEvent(product, screen);
// Sending an e-commerce event.
//   AppMetrica.getReporter("Testing API key").reportECommerce(showScreenEvent);
}

void showProductDetails() {
  Map<String, String> payload = {
    "configuration": "landscape",
    "full_screen": "true"
  };
// Creating a screen object.
  ECommerceScreen screen = ECommerceScreen(
      name: "ProductCardActivity", // Optional.
      searchQuery: "даниссимо кленовый сироп", // Optional.
      payload: payload, // Optional.
      categoriesPath: ["Акции", "Красная цена"] // Optional.
  );
  ECommerceAmount amount =
  ECommerceAmount(amount: Decimal.parse('4.53'), currency: "USD");
// Creating an actualPrice object.
  ECommercePrice actualPrice =
  ECommercePrice(fiat: amount, internalComponents: [
    // Optional.
    ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
    ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
    ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
  ]);

// Creating an originalPrice object.
  ECommercePrice originalPrice = ECommercePrice(
      fiat: ECommerceAmount(amount: Decimal.parse('5.78'), currency: "USD"),
      internalComponents: [
        // Optional.
        ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
        ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
        ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
      ]);
// Creating a product object.
  ECommerceProduct product = ECommerceProduct(
      sku: "779213",
      name: "Продукт творожный «Даниссимо» 5.9%, 130 г.",
      // Optional.
      actualPrice: actualPrice,
      // Optional.
      originalPrice: originalPrice,
      // Optional.
      promocodes: ["BT79IYX", "UT5412EP"],
      // Optional.
      payload: payload,
      // Optional.
      categoriesPath: ["Продукты", "Молочные продукты", "Йогурты"] // Optional.
  );
  ECommerceReferrer referrer = ECommerceReferrer(
      type: "button", // Optional.
      identifier: "76890", // Optional.
      screen: screen // Optional.
  );
  ECommerceEvent showProductDetailsEvent = ECommerce.showProductDetailsEvent(
      product, referrer); // Referrer is optional — can be null.
// Sending an e-commerce event.
//   AppMetrica.getReporter("Testing API key")
//       .reportECommerce(showProductDetailsEvent);
}

void addToCart() {
  Map<String, String> payload = {
    "configuration": "landscape",
    "full_screen": "true"
  };
// Creating a screen object.
  ECommerceScreen screen = ECommerceScreen(
      name: "ProductCardActivity", // Optional.
      searchQuery: "даниссимо кленовый сироп", // Optional.
      payload: payload, // Optional.
      categoriesPath: ["Акции", "Красная цена"] // Optional.
  );
  ECommerceAmount amount =
  ECommerceAmount(amount: Decimal.parse('4.53'), currency: "USD");
// Creating an actualPrice object.
  ECommercePrice actualPrice =
  ECommercePrice(fiat: amount, internalComponents: [
    // Optional.
    ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
    ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
    ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
  ]);

// Creating an originalPrice object.
  ECommercePrice originalPrice = ECommercePrice(
      fiat: ECommerceAmount(amount: Decimal.parse('5.78'), currency: "USD"),
      internalComponents: [
        // Optional.
        ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
        ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
        ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
      ]);
// Creating a product object.
  ECommerceProduct product = ECommerceProduct(
      sku: "779213",
      name: "Продукт творожный «Даниссимо» 5.9%, 130 г.",
      // Optional.
      actualPrice: actualPrice,
      // Optional.
      originalPrice: originalPrice,
      // Optional.
      promocodes: ["BT79IYX", "UT5412EP"],
      // Optional.
      payload: payload,
      // Optional.
      categoriesPath: ["Продукты", "Молочные продукты", "Йогурты"] // Optional.
  );
  ECommerceReferrer referrer = ECommerceReferrer(
      type: "button", // Optional.
      identifier: "76890", // Optional.
      screen: screen // Optional.
  );
  // Creating a cartItem object.
  ECommerceCartItem addedItems1 = ECommerceCartItem(
      product: product,
      revenue: actualPrice,
      quantity: Decimal.parse("1.0"),
      referrer: referrer // Optional.
  );
  ECommerceEvent addCartItemEvent = ECommerce.addCartItemEvent(addedItems1);
  // Sending an e-commerce event.
  AppMetrica.getReporter("Testing API key").reportECommerce(addCartItemEvent);
  ECommerceEvent removeCartItemEvent =
  ECommerce.removeCartItemEvent(addedItems1);
// Sending an e-commerce event.
//   AppMetrica.getReporter("Testing API key")
//       .reportECommerce(removeCartItemEvent);
}

void purchase() {
  Map<String, String> payload = {
    "configuration": "landscape",
    "full_screen": "true"
  };
// Creating a screen object.
  ECommerceScreen screen = ECommerceScreen(
      name: "ProductCardActivity", // Optional.
      searchQuery: "даниссимо кленовый сироп", // Optional.
      payload: payload, // Optional.
      categoriesPath: ["Акции", "Красная цена"] // Optional.
  );
  ECommerceAmount amount =
  ECommerceAmount(amount: Decimal.parse('4.53'), currency: "USD");
// Creating an actualPrice object.
  ECommercePrice actualPrice =
  ECommercePrice(fiat: amount, internalComponents: [
    // Optional.
    ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
    ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
    ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
  ]);

// Creating an originalPrice object.
  ECommercePrice originalPrice = ECommercePrice(
      fiat: ECommerceAmount(amount: Decimal.parse('5.78'), currency: "USD"),
      internalComponents: [
        // Optional.
        ECommerceAmount(amount: Decimal.parse('30570000'), currency: "wood"),
        ECommerceAmount(amount: Decimal.parse('26.89'), currency: "iron"),
        ECommerceAmount(amount: Decimal.parse('5.1'), currency: "gold"),
      ]);
// Creating a product object.
  ECommerceProduct product = ECommerceProduct(
      sku: "779213",
      name: "Продукт творожный «Даниссимо» 5.9%, 130 г.",
      // Optional.
      actualPrice: actualPrice,
      // Optional.
      originalPrice: originalPrice,
      // Optional.
      promocodes: ["BT79IYX", "UT5412EP"],
      // Optional.
      payload: payload,
      // Optional.
      categoriesPath: ["Продукты", "Молочные продукты", "Йогурты"] // Optional.
  );
  ECommerceReferrer referrer = ECommerceReferrer(
      type: "button", // Optional.
      identifier: "76890", // Optional.
      screen: screen // Optional.
  );
  // Creating a cartItem object.
  ECommerceCartItem addedItems1 = ECommerceCartItem(
      product: product,
      revenue: actualPrice,
      quantity: Decimal.parse("1.0"),
      referrer: referrer // Optional.
  );
  // Creating an order object.
  ECommerceOrder order = ECommerceOrder(
      identifier: "88528768",
      items: [addedItems1],
      payload: payload // Optional.
  );
  ECommerceEvent beginCheckoutEvent = ECommerce.beginCheckoutEvent(order);
// Sending an e-commerce event.
  AppMetrica.reportECommerce(beginCheckoutEvent);
  ECommerceEvent purchaseEvent = ECommerce.purchaseEvent(order);
// Sending an e-commerce event.
  AppMetrica.reportECommerce(purchaseEvent);
}

void profileAttributes() {
  // Creating the UserProfile instance.
  UserProfile userProfile = UserProfile([
    // Updating predefined attributes.
    NameAttribute.withValue("John"),
    GenderAttribute.withValue(Gender.MALE),
    BirthDateAttribute.withAge(24),
    NotificationEnabledAttribute.withValue(false),
    // Updating custom attributes.
    StringAttribute.withValue("string_attribute", "string"),
    NumberAttribute.withValue("number_attribute", 55),
    CounterAttribute.withDelta("counter_attribute", 1)
  ]);

// Setting the ProfileID using the method of the YandexMetrica class.
  AppMetrica.setUserProfileID("id");

// Sending the UserProfile instance.
  AppMetrica.reportUserProfile(userProfile);
}

void adRevenue() {
  Map<String, String> adRevenuePayload = {
    "payload_key_1": "payload_value_1",
    "payload_key_2": "payload_value_2"
  };

  AdRevenue adRevenue = AdRevenue(
      adRevenue: Decimal.parse("100.100"),
      currency: "USD",
      adNetwork: "ad_network",
      // Optional
      adPlacementId: "ad_placement_id",
      // Optional
      adPlacementName: "ad_placement_name",
      // Optional
      adType: AdType.NATIVE,
      // Optional
      adUnitId: "ad_unit_id",
      // Optional
      adUnitName: "ad_unit_name",
      // Optional
      precision: "some precision",
      // Optional
      payload: adRevenuePayload // Optional
  );
  AppMetrica.reportAdRevenue(adRevenue);
}

void revenue() {
  Revenue revenue1 = Revenue(Decimal.parse("2.99"), "RUB",
    quantity: 1,
    productId: "1", // "Продукт" из отчета
    payload: "{\"OrderID\":\"1\","  // id заказа
        " \"source\":\"Google Play\"}",
  );
  AppMetrica.reportRevenue(revenue1);

  Revenue revenue2 = Revenue(Decimal.parse("2.99"), "RUB",
    quantity: 1,
    productId: "2", // Продукт
    payload: "{\"OrderID\":\"1\","  // id заказа
        " \"source\":\"Google Play\"}",
  );
  AppMetrica.reportRevenue(revenue2);
  AppMetrica.sendEventsBuffer();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test', style: TextStyle(fontSize: 24)),
        ),
        body: Builder(
          builder: (BuildContext context) =>
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 5),
                child: ListView(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.reportEvent('Event name');
                      },
                      child: const Text('Report Event'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.reportError(
                          message: 'Error message',
                          errorDescription:
                          AppMetricaErrorDescription.fromCurrentStackTrace(
                              message: 'Error message', type: 'Error type'),
                        ).ignore();
                      },
                      child: const Text('Report Error'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.reportUnhandledException(
                          AppMetricaErrorDescription.fromCurrentStackTrace(
                              message: 'Error message', type: 'Error type'),
                        );
                      },
                      child: const Text('Report Unhandled Exception'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await Future.delayed(
                              Duration.zero, () => throw Exception('Error'));
                        } on Exception catch (e, stacktrace) {
                          AppMetrica.reportUnhandledException(
                            AppMetricaErrorDescription.fromObjectAndStackTrace(
                                e, stacktrace),
                          );
                        }
                      },
                      child: const Text('Catch Throwen Error'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.reportAppOpen(
                            'https://appmetrica.yandex.com');
                      },
                      child: const Text('Report App Open'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.reportReferralUrl(
                            "https://appmetrica.yandex.com");
                      },
                      child: const Text('Report Referral Url'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.setLocationTracking(true);
                      },
                      child: const Text('Set Location Tracking'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.setStatisticsSending(true);
                      },
                      child: const Text('Set Statistic Sending'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppMetrica.sendEventsBuffer();
                      },
                      child: const Text('Send Events Buffer'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final deviceId =
                        await AppMetrica.requestAppMetricaDeviceID();
                        _showSnackBar(context, "DeviceId $deviceId");
                      },
                      child: const Text('Request DeviceId'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final version = await AppMetrica.libraryVersion;
                        _showSnackBar(context, "Library version $version");
                      },
                      child: const Text('Get library version'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        throw Exception("test crash");
                      },
                      child: const Text('crash'),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String content) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.hideCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

