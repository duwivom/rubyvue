<template>
    <div id="app">
        <p>{{ message }}</p>

        <span>Title</span>
        <input v-model="title">
        <span>Text</span>
        <input v-model="text">

        <button @click="submit()">Submit</button>

        <ul>
            <li v-for="a in articles" :key="a.id">{{a.title}}</li>
        </ul>
    </div>
</template>

<script>
import axios from "axios";
export default {
    data: function() {
        return {
            title: 'Title',
            text: 'Text',
            message: "Hello Vue! 123 test reload",
            articles: [],
        };
    },
    mounted() {
        this.getArticles()
    },
    methods: {
        getArticles() {
            axios.get('/articles').then(resp => {
                this.articles = resp.data
            })
        },
        submit() {
            axios.post('/articles', {title: this.title, text: this.text}).then(resp => {
                this.getArticles()
            })
        }
    }
};
</script>

<style scoped>
p {
    font-size: 2em;
    text-align: center;
}
</style>
