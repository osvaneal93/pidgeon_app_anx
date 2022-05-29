import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pidgeon_app/src/data/models/lesson_model.dart';

abstract class BaseRepoLesson {
  Stream<List<LessonModel>> getAllLessons();
}


class RepoLesson extends BaseRepoLesson {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  RepoLesson({FirebaseFirestore? firestore});

  @override
  Stream<List<LessonModel>> getAllLessons() {
    return _firebaseFirestore
        .collection('lessons')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (e) => LessonModel.fromJson(e.data()),
          )
          .toList();
    });
  }
}
