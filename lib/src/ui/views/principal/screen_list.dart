import 'package:pidgeon_app/src/ui/views/principal/lecciones_view.dart';
import 'package:pidgeon_app/src/ui/views/principal/notes_view.dart';
import 'package:pidgeon_app/src/ui/views/principal/principal_view.dart';
import 'package:pidgeon_app/src/ui/views/principal/santuary_view.dart';

class ScreenList {
  final List screenList = [
    const PrincipalView(),
    const LessonsView(),
    const NotesView(),
    const SantuaryView()
  ];
}
