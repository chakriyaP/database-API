import express from "express";
import {
    getAll,
} from "../method/functionGet.js";

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET customers`);
    getAll("customers").then((values) => {
        console.log(values);
        res.json(values);
    });
});


export default route;