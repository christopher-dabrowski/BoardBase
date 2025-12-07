use("mtg");

db.setList.mapReduce(
  function () {
    const year = this.releaseDate.getFullYear();
    emit(year, this.block);
  },
  function (_, blocks) {
    const result = { blocks: {} };
    for (const block of blocks) {
      result.blocks[block] ??= 0;
      result.blocks[block] += 1;
    }
    return result;
  },
  {
    out: { inline: 1 },
    query: { block: { $exists: true }, releaseDate: { $exists: true } },
  }
).results.sort((a, b) => b._id - a._id);
