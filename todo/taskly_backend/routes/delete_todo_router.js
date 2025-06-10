const express=require('express')
const delete_todo_router=express.Router()
const DeleteTodoController=require('../controller/delete_todo_controller')

delete_todo_router.delete('/deleteUserTodo',DeleteTodoController.deleteUserTodo)

module.exports=delete_todo_router