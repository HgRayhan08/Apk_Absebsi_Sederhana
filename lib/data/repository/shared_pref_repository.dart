abstract interface class SharedPrefRepository {
  Future<bool> saveDataLogin(List<String> user);
  Future<void> removeDataLogin();
  Future<List<String>?> getDataLogin();
}
