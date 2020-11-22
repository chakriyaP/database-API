import express from "express";
import {
    getAll,
    getOrders
} from "../method/functionGet.js";

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET orders`);
    getAll("orders_1").then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/", (req, res) => {
    getOrders(req).then((values) => {
        console.log(values);
        res.json(values);
    });
});
export default route;