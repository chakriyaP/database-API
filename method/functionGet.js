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


export async function getPattern(req) {
    const { p_id, amount_use } = req.body
    const queryString = `Select * From patterns Where p_id Like '%${p_id}%' and amount_use Like '%${amount_use}%'`;
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



export async function getEmployee(req) {
    const { eid, empname, empphone } = req.body
    const queryString = `Select * From employee Where eid Like '%${eid}%' and empname Like '%${empname}%' and empphone Like '%${empphone}%'`;
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

export async function getOrders(req) {
    const { order_id, ocid, order_amount, size, bcolor, opid, o_start_date, o_end_date } = req.body
    const queryString = `SELECT *
    FROM orders_1 
    WHERE order_id LIKE '%${order_id}%' AND ocid LIKE '%${ocid}%' AND order_amount LIKE '%${order_amount}%'
     AND size LIKE '%${size}%' AND bcolor LIKE '%${bcolor}%' AND opid LIKE '%${opid}%' 
     AND o_start_date LIKE '%${o_start_date}%' AND o_end_date LIKE '%${o_end_date}%';`;
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