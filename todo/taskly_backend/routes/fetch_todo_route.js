const express=require('express');
const fetch_todo_router=express.Router()
const FetchTodoController=require('../controller/fetch_todo_controller');

fetch_todo_router.get('/fetchUserTodos',FetchTodoController.fetchUserTodos)

module.exports=fetch_todo_router