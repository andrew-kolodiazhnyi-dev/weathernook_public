import 'package:hive_ce/hive.dart';

import '../../api/models/location.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Location>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}
