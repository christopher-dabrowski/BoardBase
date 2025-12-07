use("mtg");

const baseSetCode = "OTJ"

db.setList.aggregate([
  { $match: { code: baseSetCode } },

  {
    $graphLookup: {
      from: "setList",
      startWith: "$code",
      connectFromField: "code",
      connectToField: "parentCode",
      as: "childSets",
    },
  },
  {
    $project: {
      parentSet: {
        code: "$code",
        name: "$name",
        type: "$type",
      },
      childSets: {
        $map: {
          input: "$childSets",
          as: "child",
          in: {
            code: "$$child.code",
            name: "$$child.name",
            type: "$$child.type",
          },
        },
      },
    },
  },
]);

