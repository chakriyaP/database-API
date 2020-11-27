import express from "express";
import {
    getAll,
    getEmployee
} from "../method/functionGet.js";
import {
    postEmployee
} from "../method/functionPost.js";
import {
    deleteemployee
} from "../method/functionDelete.js";

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

route.post("/insert", (req, res) => {
    postEmployee(req).then((values) => {
        console.log(values);
        res.json({ massage: "post sucess" });
    });
});

route.delete("/delete", (req, res) => {
    deleteemployee(req).then((values) => {
        console.log(values);
        res.json({ massage: "delete sucess" });
    });
});

export default route;