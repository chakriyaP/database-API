import connector from "./connector.js";

export async function updateStock(req) {
    const { color, amount_stock, color_edit, amount_stock_edit } = req.body
    const queryString = `UPDATE stock
    SET color = '${color_edit}', amount_stock = ${amount_stock_edit}
    WHERE color LIKE '%${color}%' AND amount_stock LIKE '%';`;
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