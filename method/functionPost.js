import connector from "./connector.js";

export async function postEmployee(req) {
    const { eid, empname, empphone } = req.body
    const queryString = `INSERT INTO employee VALUE ('${eid}','${empname}','${empphone}');`;
    let res = await connector
        .getConnection()
        .then(async(conn) => {
            let response = await conn.query(queryString);
            conn.release();
            if (response.length != 0) {
                return response;
            } else {
                return { error: response };
            }
        })
        .catch((err) => {
            conn.release();
            return { error: err.message };
        });
    return res;
}


export async function postStock(req) {
    const { color, amount_stock } = req.body
    const queryString = `INSERT INTO stock VALUE ('${color}','${amount_stock}');`;
    let res = await connector
        .getConnection()
        .then(async(conn) => {
            let response = await conn.query(queryString);
            conn.release();
            if (response.length != 0) {
                return response;
            } else {
                return { error: response };
            }
        })
        .catch((err) => {
            conn.release();
            return { error: err.message };
        });
    return res;
}