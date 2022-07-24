<template>
  <div>
    <input type="text" v-model="newTodoItem">
    <button v-on:click="addTodo"> add </button>
  </div>
</template>


<script>

  export default {

    data : function() {
      return {
        newTodoItem: 'gggg3'
      }
    },
    methods: {
      addTodo: function () {
        localStorage.setItem(this.newTodoItem, this.newTodoItem);
        this.newTodoItem = '';
      },
    }

  }

</script>

<style></style>