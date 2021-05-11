extension IterableModifier<E> on Iterable<E> {
  E? firstWhereNullable(bool Function(E) test) =>
      this.cast<E?>().firstWhere((v) => test(v!), orElse: () => null);
}
