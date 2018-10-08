<template>
    <article id="main-content">
        <header>
            <h1>{{ title }}</h1>
            <h4 class="time">{{ publishTime }}</h4>
            <h4>
                <span class="tag" v-for="tag in tags">{{ tag }}</span>
            </h4>
        </header>
        <p v-html="parseMarkdown(content)"></p>
        <markdown-titles class="nav-detail-tip" :list="navTitles.nav" :totalLength="navTitles.length"/>
    </article>
</template>

<script>
/**
 * @author veekergdn.cn
 * @file 特定文章组件
 */

import parseMarkdown from '@/utils/parseMarkdown'
import moment from 'moment'
import mkTitles from '@/utils/mkTitles';
import markdownTitlesComponent from  '@/components/markdown-titles';
import Vue from 'vue';
Vue.component(markdownTitlesComponent.name, markdownTitlesComponent);
moment.locale('zh-CN');
export default {
    data() {
        return {
            title: '',
            publishTime: '',
            tags: '',
            content: '',
            navTitles: ''
        }
    },
    created() {
        const id = this.$route.params.id;
        axios.get(`/api/v1/articles/${id}`)
            .then(res => {
                const data = res.data[0];
                this.title = data.title;
                this.publishTime = moment(data.publishTime).format('YYYY年 MMM DD日 HH:mm:ss');
                this.content = data.content;
                this.navTitles = mkTitles(data.content);
                console.log(this.navTitles);
                //console.log(this.content);
                this.tags = data.tags ? data.tags.split(',') : []
            })
            .catch(err => alert(err))
    },
    methods: {
        parseMarkdown
    }
}
</script>

<style lang="scss" scoped>
.tag {
    color: $quote;
    margin-right: 1em;
}
@media screen and (min-width: 800px) {
    #main-content {
        margin-right: 130px;
    }
    .nav-detail-tip {
        position: fixed;
        z-index: 1;
        top: 20%;
        right: 4%;
        width: 20%;
        border-left: 1px solid #ddd;
        padding-left: 30px;
        background-color: #fff;
        font-size: 15px;
        transition: all .2s ease;
    }
}


</style>
