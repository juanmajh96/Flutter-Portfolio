import 'button_propieties.dart';

class Category extends ButtonPropieties {
  Category(
    this.route,
    this.title,
  );
  @override
  // ignore: overridden_fields
  final String route;
  @override
  // ignore: overridden_fields
  final String title;
  @override
  // ignore: overridden_fields
  bool seen = false;
}
