<template>
    <ul class="nav-list">
        <li v-for="(nav, index) in list" :key="index">
            <a :href="nav.index | anchor " :class="{active: highlightIndex === nav.index}" @click="activeAnchor(nav.index)">{{nav.title}}</a>
           <!-- <markdown-titles  :list="nav.children" v-if="nav.children.length > 0" v-on:childMethod="activeAnchor"/>-->
            <ul class="nav-list"  v-if="nav.children.length">
                <li v-for="(nav, index) in nav.children" :key="index">
                    <a :href="nav.index | anchor " :class="{active: highlightIndex === nav.index}" @click="activeAnchor(nav.index)">{{nav.title}}</a>
                    <ul class="nav-list"  v-if="nav.children.length">
                        <li v-for="(nav, index) in nav.children" :key="index">
                            <a :href="nav.index | anchor " :class="{active: highlightIndex === nav.index}" @click="activeAnchor(nav.index)">{{nav.title}}</a>
                            <ul class="nav-list"  v-if="nav.children.length">
                                <li v-for="(nav, index) in nav.children" :key="index">
                                    <a :href="nav.index | anchor " :class="{active: highlightIndex === nav.index}" @click="activeAnchor(nav.index)">{{nav.title}}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</template>
<script>
    export default {
        name: "markdown-titles",
        props: {
            list: Array,
            totalLength: Number
        },
        data() {
           return {
               highlightIndex: 0
           }
        },
        created() {
            // console.log("ddd",this.list);
            // console.log(this.highlightIndex)
        },
        methods: {
            activeAnchor(value){
                // console.log(value);
                this.highlightIndex = value;
                // this.$emit('childMethod','childParam');
            },
            scrollHandler() {
                const idPrefix = 'titleAnchor-';
                const distance = 10;
                let list = [];
                for (let i = 0; i < this.totalLength; i++) {
                    let dom = document.getElementById(`${idPrefix}${i}`);
                    let domTitle = document.querySelector(`a[href="#titleAnchor-${i}"]`);
                    list.push({
                        y: dom.getBoundingClientRect().top + 10, // 利用dom.getBoundingClientRect().top可以拿到元素相对于显示器的动态y轴坐标
                        index: i,
                        domTitle
                    })
                }

                let readingVO = list.filter(item => item.y > distance).sort((a, b) => {
                    return a.y - b.y
                })[0]; // 对所有的y值为正标的题，按y值升序排序。第一个标题就是当前处于阅读中的段落的标题。也即要高亮的标题

                if (typeof readingVO !== 'undefined') {
                    this.highlightIndex = readingVO.index;
                }
            }
        },
        mounted () {
            window.addEventListener('scroll', this.scrollHandler);
        },
        filters: {
            anchor(value) {
                //let index = 0;
                return `#titleAnchor-${value}`;
            }
        }
    }
</script>
<style lang="scss">
    .nav-list {
        margin-left: 15px;
        list-style: square;
        padding-left: 0;
        font-size: 13px;

        a {
            display: block;
            color: #333;
            padding: 2px 1px 1px 5px;
            &:link, &:visited {
                text-decoration: none;
            }

            &:hover {
                text-decoration: underline;
            }

            &.active {
                color: #FF4400;
                font-weight: 600;
                background-color: #f3f3f3;
                transition:all 0.5s ease-in-out 0s;   /* 常用的简写方式 */
           }
        }
    }
</style>