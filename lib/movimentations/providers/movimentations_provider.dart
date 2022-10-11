import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/movimentation_model.dart';

final movimentationsListProvider = StateProvider<List<MovimentationModel>>((ref) => []);