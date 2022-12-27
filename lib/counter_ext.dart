Future<void> delay(int seconds, Function()? computation) async {
  return await Future.delayed(
    Duration(seconds: seconds),
    computation,
  );
}
