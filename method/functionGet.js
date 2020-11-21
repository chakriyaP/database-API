import connector from "./connector.js";


export async function getAll(table) {
    const queryString = `SELECT * FROM ${table};`;
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


export async function getCustomers(req) {
    const { fname, lname, c_id, customers_address, phone, id_line } = req.body
    const queryString = `Select * From customers1 Where fname Like '%${fname}%' and lname Like '%${lname}%' and c_id Like '%${c_id}%' 
    and customers_address Like '%${customers_address}%' and phone Like '%${phone}%' and id_line Like '%${id_line}%'; `;
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

export async function getStock(req) {
    const { color, amount_stock } = req.body
    const queryString = `Select * From stock Where color Like '%${color}%' and amount_stock Like '%${amount_stock}%'`;
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