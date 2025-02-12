import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> listproviders = [
  ChangeNotifierProvider<ServicesProvider>(
    create: (context) => ServicesProvider(),
  ),
];
