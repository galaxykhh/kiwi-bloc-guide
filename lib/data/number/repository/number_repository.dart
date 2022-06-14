import 'package:rxdart/subjects.dart';

class NumberRepository {
  NumberRepository() {
    _initialize();
  }

  final _numbersSubject = BehaviorSubject<List<int>>();

  final _duration = const Duration(seconds: 2);

  Future<void> _initialize() async {
    await Future.delayed(_duration);
    if (_numbersSubject.isClosed) {
      return;
    }

    _numbersSubject.add(List.generate(30, (i) => i));
  }

  Stream<List<int>> getNumbers() => _numbersSubject.stream;

  Future<void> getMoreNumbers() async {
    await Future.delayed(_duration);
    final int lastNumber = _numbersSubject.value.last;
    final List<int> newNumbers = List.generate(30, (i) => i + lastNumber + 1);

    if (_numbersSubject.isClosed) {
      return;
    }

    _numbersSubject.add([
      ..._numbersSubject.value,
      ...newNumbers,
    ]);
  }

  void dispose() => _numbersSubject.close();
}
