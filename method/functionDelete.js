import connector from "./connector.js";
export async function deleteemployee(req) {
    const { eid, empname, empphone } = req.body
    const queryString = `DELETE FROM works_on 
    WHERE emp_id_work_on LIKE '%${eid}%' AND order_id_work_on LIKE '%' AND works_hours LIKE '%';
    DELETE FROM employee
    WHERE eid LIKE '%${eid}%' AND empname LIKE '%' AND empphone LIKE '%';`;
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