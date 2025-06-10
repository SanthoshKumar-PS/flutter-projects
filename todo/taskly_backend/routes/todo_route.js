const express=require('express')
const todo_router=express.Router()
const TodoController=require('../controller/todo_controller')

todo_router.post('/addNewTodo',TodoController.addNewTodo)

module.exports=todo_router