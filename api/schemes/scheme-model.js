// scheme-model
const db = require("../../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  //SELECT * FROM Schemes;
  return db("schemes");
}

function findById(id) {
  //SELECT * FROM Schemes WHERE id = id;
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  //SELECT * FROM steps WHERE scheme_id = 1 ORDER BY step_number;
  return db("steps").where({ scheme_id: id }).orderBy("step_number", "asc");
}

function add(scheme) {
  //INSERT INTO schemes (scheme_name) VALUES ("Steal the moon");
  return db("schemes")
    .insert(scheme)
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  //UPDATE schemes SET scheme_name = "Dance With Me Lampy" WHERE id = 1;
  return db("schemes")
    .where("id", id)
    .update(changes)
    .then((ids) => {
      return findById(id);
    });
}

function remove(id) {
  //DELETE FROM schemes WHERE id = 11;
  return db("schemes").where("id", id).del();
}
