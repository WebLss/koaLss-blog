/**
 * @author veekergdn.cn
 * @file briefs的model
 */

import query from '../utils/query';
import escape from '../utils/escape';

class Briefs {
    async getBrief() {
        return await query('SELECT * FROM lss_about');
    }

    async updateBrief(id, content) {
        return await query(escape`UPDATE lss_about SET content=${content} WHERE id=${id}`);
    }
}

export default new Briefs();
