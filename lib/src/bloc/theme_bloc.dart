import 'package:bloc/bloc.dart';

import '../model/theme_model.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeType> {
  ThemeBloc() : super(ThemeType.light);

  @override
  Stream<ThemeType> mapEventToState(ThemeEvent event) async* {
    if (event == ThemeEvent.toggle) {
      yield state == ThemeType.light ? ThemeType.dark : ThemeType.light;
    }
  }
}
