void main() {

  // Future<void> todo(int second) async {
  //   await Future.delayed(Duration(seconds: second));
  //   print("Todo $second");
  // }
  //
  // todo(3);


  Stream<int> test() async* {

    int count = 0;
    for (int i = 0; i < 5; i++) {
      count++;
      await Future.delayed(Duration(seconds: i));
      print("Count: $count");

      yield count;
    }
  }

  test().listen((event) { });


}