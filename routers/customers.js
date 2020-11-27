import express from "express";
import {
    getAll,
    getCustomers
} from "../method/functionGet.js";

import {
    postCustomers
} from "../method/functionPost.js"

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET customers`);
    getAll("customers1").then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/", (req, res) => {
    getCustomers(req).then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/insert", (req, res) => {
    postCustomers(req).then((values) => {
        console.log(values);
        res.json({ massage: "post sucess" });
    });
});

export default route;