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


export async function postCustomers(req) {
    const { fname, lname, c_id, customers_address, phone, id_line } = req.body
    const queryString = `INSERT INTO customers VALUE ('${fname}','${lname}','${id_line}','${c_id}','${phone}');
    INSERT INTO customers_address VALUE ('${c_id}','${customers_address}');`;
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


export async function postOrders(req) {
    const { order_id, ocid, order_amount, size, ocolor, opid, o_start_date, o_end_date, s_type } = req.body
    const queryString = `INSERT INTO orders VALUE ('${ocid}',${order_amount},'${opid}','${s_type}',${o_start_date},${o_end_date},'${order_id}');
    INSERT INTO orders_size VALUE ('${size}','${order_id}');
    INSERT INTO order_color VALUE ('${ocolor}','${order_id}');`;
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

export async function postPattern(req) {
    const { p_id, amount_use } = req.body
    const queryString = `INSERT INTO patterns VALUE ('${p_id}','${amount_use}');`;
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