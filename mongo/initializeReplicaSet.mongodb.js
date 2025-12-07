const config = {
  _id: "rsmtg",
  version: 1,
  members: [
    {
      _id: 1,
      host: "mongodb:27017",
      priority: 3
    },
    {
      _id: 2,
      host: "mongodb-secondary1:27017",
      priority: 2
    },
    {
      _id: 3,
      host: "mongodb-secondary2:27017",
      priority: 1
    }
  ]
};
rs.initiate(config, { force: true });

rs.status();

db.runCommand({ hello: 1 });
