import express from "express";
import {
    getAll,
    getPattern,
} from "../method/functionGet.js";

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET orders`);
    getAll("patterns").then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/", (req, res) => {
    getPattern(req).then((values) => {
        console.log(values);
        res.json(values);
    });
});


export default route;