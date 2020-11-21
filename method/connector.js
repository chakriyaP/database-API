import mariadb from "mariadb";

const connector = mariadb.createPool({
    host: "localhost",
    database: "projectdatabase",
    port: "3306",
    user: "root",
    password: "",
    multipleStatements: true,
});

export default connector;