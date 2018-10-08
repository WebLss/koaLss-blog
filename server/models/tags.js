/**
 * @author veekergdn.cn
 * @file tags的model
 */

import query from '../utils/query';
import escape from '../utils/escape';

class Tags {
    async updateTag(id, tags) {
        return await query(escape`UPDATE lss_article SET tags=${tags} WHERE id=${id}`);
    }
}

export default new Tags();
