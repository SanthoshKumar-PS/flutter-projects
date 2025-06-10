const connectDB=require('./config/db')
const express=require('express')
const app=express()

app.use(express.json());

const cors=require('cors');
app.use(cors())

const login_register_router=require('./routes/user_route')
const new_todo_router=require('./routes/todo_route')
const fetch_todo_router=require('./routes/fetch_todo_route')
const delete_todo_router=require('./routes/delete_todo_router')
const update_status_router=require('./routes/update_status_router')



app.use('/signuser',login_register_router);
app.use('/Todo',new_todo_router);
app.use('/UserTodos',fetch_todo_router);
app.use('/delete',delete_todo_router)
app.use('/update',update_status_router)

connectDB()
app.listen(500,()=>{
    console.log("Server is running in the port 500");
})