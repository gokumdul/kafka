part of kafka.common;

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

/// Data structure representing consumer offset.
class ConsumerOffset {
  final String topicName;
  final int partitionId;
  final int offset;
  final String metadata;
  final int? errorCode;

  ConsumerOffset(this.topicName, this.partitionId, this.offset, this.metadata,
      [this.errorCode]);
}
