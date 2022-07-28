<template>
  <div>
    <ul>
      <li v-for="(todoItem, index) in todoItems" v-bind:key="todoItem.item" class="shadow">
          <i class="checkBtn fa-solid fa-font-awesome" v-bind:class="{checkBtnCompleted: todoItem.completed}" v-on:click="toggleComplete(todoItem)"></i>
        <span v-bind:class="{textCompleted: todoItem.completed}">{{todoItem.item}}</span>
        <span class="removeBtn" v-on:click="removeTodo(todoItem, index)">
          <i class="fa-solid fa-trash"></i>
        </span>

      </li>
    </ul>
  </div>
</template>


<script>

  export default {
    data: function () {
      return {
        todoItems: []
      }
    },
    created: function () {
      if (localStorage.length > 0) {
        for (var i = 0; i < localStorage.length; i++) {
          this.todoItems.push(JSON.parse(localStorage.getItem(localStorage.key(i))));
        }
      }
    },

    methods: {
      toggleComplete: function (todoItem) {
        todoItem.completed = !todoItem.completed;
        localStorage.removeItem(todoItem.item);
        localStorage.setItem(todoItem.item, JSON.stringify(todoItem));
      },
      removeTodo: function (todoItem, index) {
        localStorage.removeItem(todoItem);
        this.todoItems.splice(index, 1);
      },
    }
  }

</script>

<style>
  ul {
    list-style-type: none;
    padding-left: 0px;
    margin-top: 0;
    text-align: left;
  }

  li {
    display: flex;
    min-height: 50px;
    height: 50px;
    line-height: 50px;
    margin: 0.5rem 0;
    padding: 0 0.9rem;
    background: white;
    border-radius: 5px;
  }

  .checkBtn {
    line-height: 45px;
    color: #62acde;
    margin-right: 5px;
  }
  .checkBtnCompleted {
    color: #b3adad;
  }
  .textCompleted {
    text-decoration: line-through;
    color: #b3adad;
  }
  .removeBtn {
    margin-left: auto;
    color: #de4343;
  }

</style>