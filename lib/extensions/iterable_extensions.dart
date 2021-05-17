extension IterableModifier<E> on Iterable<E> {
  E? firstWhereNullable(bool Function(E) test) =>
      cast<E?>().firstWhere((v) => v != null && test(v), orElse: () => null);
}
