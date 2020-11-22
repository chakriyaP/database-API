import express from "express";
import {
    getAll,
    getEmployee
} from "../method/functionGet.js";

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET orders`);
    getAll("employee").then((values) => {
        console.log(values);
        res.json(values);
    });
});


route.post("/", (req, res) => {
    getEmployee(req).then((values) => {
        console.log(values);
        res.json(values);
    });
});
export default route;