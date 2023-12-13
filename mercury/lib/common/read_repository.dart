abstract class ReadRepository<TEntity, TKey> {
  Future<List<TEntity>> readAll();
  Future<List<TEntity>> read(TKey key);
}
