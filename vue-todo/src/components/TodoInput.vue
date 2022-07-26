<template>
  <div class="inputBox shadow">
    <input type="text" v-model="newTodoItem" v-on:keyup.enter="addTodo">
    <span class="addContainer" v-on:click="addTodo">
      <i class="fa-solid fa-plus addBtn"></i>
    </span>
  </div>
</template>

<!--<script src="https://kit.fontawesome.com/467a6c2033.js" crossorigin="anonymous"></script>-->

<script>

  export default {

    data : function() {
      return {
        newTodoItem: 'test'
      }
    },
    methods: {
      addTodo: function () {
        localStorage.setItem(this.newTodoItem, this.newTodoItem);
        this.clearInput();
      },

      clearInput: function () {
        this.newTodoItem = '';
      },
    }

  }

</script>

<style scoped>
  .inputBox {
    border-style: none;
    font-size: 0.9rem;
  }

  .addContainer {
    float: right;
    background: linear-gradient(to right, #6478FB,#6478FB);
    display: block;
    width: 3rem;
    border-radius: 0 5px 5px 0;
  }

  .addBtn {
    color: white;
    vertical-align: middle;
  }
</style>