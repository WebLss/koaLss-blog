/**
 * @author veekergdn.cn
 * @file books的model
 */

import query from '../utils/query';
import escape from '../utils/escape';

class Books {
    async getAllBooks() {
        return await query('SELECT * FROM lss_rd_list');
    }

    async addBook({name, author, score}) {
        return await query(escape`INSERT INTO lss_rd_list SET name=${name},author=${author},score=${score}`);
    }

    async updateBook(id, {name, author, score}) {
        return await query(escape`UPDATE lss_rd_list SET name=${name},author=${author},score=${score} WHERE id=${id}`);
    }

    async deleteBook(id) {
        return await query(escape`DELETE FROM lss_rd_list WHERE id=${id}`);
    }
}

export default new Books();
