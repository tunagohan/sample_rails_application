<template>
  <tbody>
    <input type="text" v-model="keyword" />
    <tr v-for="book in filterBooks" :key="book.id">
      <td v-text="book.title"></td>
      <td v-text="book.description"></td>
      <td v-text="book.price"></td>
    </tr>
  </tbody>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      keyword: "",
      books: []
    };
  },

  mounted: function() {
    this.getBooks();
  },

  computed: {
    filterBooks: function() {
      return this.filteredBooks();
    }
  },
  methods: {
    getBooks: function() {
      axios
        .get("/api/v1/books.json")
        .then(response => (this.books = response.data));
    },
    filteredBooks: function() {
      var books = [];
      for (var i in this.books) {
        var book = this.books[i];
        if (book.title.indexOf(this.keyword) !== -1) {
          books.push(book);
        }
      }
      return books;
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
