abstract interface class StateManagement<T> {
  T get state;

  void set(T state);

  StateManagementDispose listen(void Function(T) listener);

  void dispose();
}

typedef StateManagementDispose = void Function();
