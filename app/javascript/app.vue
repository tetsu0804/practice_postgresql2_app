<template>
  <div id="app">
    <p>{{ message }}</p>
    <form v-on:submit="onSubmit">
      <input v-model="blog_name">
      <button type="submit">登録</button>
    </form>
    <div v-for="blog in blogs" :key="blog.id">
      <p>{{blog.name}}</p>
    </div>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      blog_name: "",
      blogs: []
    }
  },
  mounted() {
    axios.get('/api/blogs')
    .then(response => {
      this.blogs = response.data.blogs
    })
  },
  methods: {
    onSubmit() {
      axios.post('/api/blog', {name: this.blog_name})
      .then(response => {
        this.name = ''
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
