import express from "express";
import {
    getAll,
    getCustomers
} from "../method/functionGet.js";

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

export default route;