
/**
 * @author veekergdn.cn
 * @file articles的model
 */

import query from '../utils/query';
import escape from '../utils/escape';

class Articles {
    async addArticle() {
        return await query('INSERT INTO lss_article SET title=\'新文章\',tags=\'\',createTime=NOW(),publishTime=NOW(),content=\'\'');
    }

    async getAllArticles() {
        return await query('SELECT * FROM lss_article ORDER BY createTime DESC');
    }

    async getLimitArticles(offset, limit) {
        return await query(escape`SELECT * FROM lss_article WHERE isPublished=1 ORDER BY publishTime DESC LIMIT ${parseInt(offset, 10)},${parseInt(limit, 10)}`);
    }

    async getPagination() {
        return await query('SELECT COUNT(*) FROM lss_article WHERE isPublished=1');
    }

    async getOneArticle(id) {
        return await query(`SELECT * FROM lss_article WHERE id=${id}`);
    }

    async updateArticle(id, {title, tags, content, isPublished}) {
        return await query(escape`UPDATE lss_article SET title=${title}, tags=${tags}, content=${content} WHERE id=${id}`);
    }

    async publishArticle(id, {title, tags, content}) {
        return await query(escape`UPDATE lss_article SET title=${title}, tags=${tags}, content=${content}, publishTime=NOW(), isPublished=1 WHERE id=${id}`);
    }

    async deleteArticle(id) {
        return await query(escape`DELETE FROM lss_article WHERE id=${id}`);
    }
}

export default new Articles();
