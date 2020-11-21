import express from "express";
import bodyParser from "body-parser";
import path from "path";

import orderRouter from "./routers/orders.js";
<<<<<<< HEAD
import customersRouter from "./routers/customers.js";
=======
<<<<<<< HEAD
import employeeRouter from "./routers/employees.js";
=======
import stockRouter from "./routers/stock.js";
import printPatternRouter from "./routers/printPattern.js";

>>>>>>> 0713393b3dc80b983140454d9c5b8bb989ddad1c
>>>>>>> a354691e08ba78b30b72892121cd248885e9926d

const port = 3000;
const app = express();
const _dirname = path.resolve();

app.use(bodyParser.json());
app.use("/orders", orderRouter);
<<<<<<< HEAD
app.use("/customers", customersRouter)
=======
<<<<<<< HEAD
app.use("/employees", employeeRouter)
=======
app.use("/stock", stockRouter);
app.use("/printPattern", printPatternRouter);

>>>>>>> 0713393b3dc80b983140454d9c5b8bb989ddad1c
>>>>>>> a354691e08ba78b30b72892121cd248885e9926d

app.get("/", (req, res) => {
    res.json({ msg: "welcome delivery" });
});

app.listen(port, () => {
    console.log("api server listen on http://localhost:" + port);
});