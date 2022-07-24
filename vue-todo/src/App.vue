<template>
  <div id="app">

    <todo-header></todo-header>
    <todo-input></todo-input>
    <todo-list></todo-list>
    <todo-footer></todo-footer>


  </div>
</template>

<script>

import TodoHeader from "@/components/TodoHeader";
import TodoFooter from "@/components/TodoFooter";
import TodoInput from "@/components/TodoInput";
import TodoList from "@/components/TodoList";
export default {
  components: {TodoList, TodoInput, TodoFooter, TodoHeader}
}
</script>

<style>

  body{
    text-align: center;
    background-color: #F6F6F6;
  }

  input {
    border-style: groove;
    width: 200px;
  }

  button {
    border-style: groove;
  }

  .shadow {
    box-shadow: 5px 10px 1px rgba(0, 0, 0, 0.03);

  }
</style>
