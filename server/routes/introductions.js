/**
 * @User : veeker-180296
 * @Date : 2018-10-03 13:54
 * @Desc : inits
 */


import Router from 'koa-router';
import {baseApi} from '../config';
import IntroController from '../controllers/introductions';

const api = 'introductions';

const router = new Router();

router.prefix(`/${baseApi}/${api}`);

router.get('/', IntroController.getIntroductions);

module.exports = router;
