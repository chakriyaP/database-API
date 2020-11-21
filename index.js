import express from "express";
import bodyParser from "body-parser";
import path from "path";

import orderRouter from "./routers/orders.js";
import employeeRouter from "./routers/employees.js";

const port = 3000;
const app = express();
const _dirname = path.resolve();

app.use(bodyParser.json());
app.use("/orders", orderRouter);
app.use("/employees", employeeRouter)

app.get("/", (req, res) => {
    res.json({ msg: "welcome delivery" });
});

app.listen(port, () => {
    console.log("api server listen on http://localhost:" + port);
});