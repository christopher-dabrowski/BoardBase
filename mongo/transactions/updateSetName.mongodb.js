use("mtg");

const code = "EOE";
// const newName = "Edge of Eternity";
const newName = "Edge of Eternities";

const session = db.getMongo().startSession();
const db = session.getDatabase("mtg");
const setList = db.setList;
const sets = db.sets;
const standard = db.standard;

session.startTransaction({ readConcern: { level: "local" }, writeConcern: { w: "majority" } });

try {
  setList.updateMany(
    { code: code },
    [
      {
        $set: { name: newName, mcmName: newName }
      }
    ]
  );

  sets.updateMany(
    { code: code },
    [
      {
        $set: { name: newName, mcmName: newName }
      }
    ]
  );

  standard.updateMany(
    { code: code },
    [
      {
        $set: { name: newName, mcmName: newName }
      }
    ]
  );
} catch (error) {
  session.abortTransaction();
  throw error;
}

session.commitTransaction();
session.endSession();

// db.setList.updateMany(
//   { code: code },
//   [
//     {
//       $set: { name: newName, mcmName: newName }
//     }
//   ]
// );

// db.sets.updateMany(
//   { code: code },
//   [
//     {
//       $set: { name: newName, mcmName: newName }
//     }
//   ]
// );

// db.standard.updateMany(
//   { code: code },
//   [
//     {
//       $set: { name: newName, mcmName: newName }
//     }
//   ]
// );
