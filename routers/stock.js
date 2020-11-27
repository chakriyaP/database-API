import express from "express";
import {
    getAll,
    getStock
} from "../method/functionGet.js";
import {
    postStock
} from "../method/functionPost.js";
import {
    updateStock
} from "../method/functionUpdate.js";

const route = express.Router();

route.get("/", (req, res) => {
    console.log(`GET orders`);
    getAll("stock").then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/", (req, res) => {
    getStock(req).then((values) => {
        console.log(values);
        res.json(values);
    });
});

route.post("/insert", (req, res) => {
    postStock(req).then((values) => {
        console.log(values);
        res.json({ massage: "post sucess" });
    });
});

route.put("/update", (req, res) => {
    updateStock(req).then((values) => {
        console.log(values);
        res.json({ massage: "update sucess" });
    });
})




export default route;