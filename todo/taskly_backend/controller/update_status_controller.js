const TodoModel= require('../model/todo_model');

exports.updateTodoStatus=async function (req,res) {
    try{
        const {id,userId,status}= req.body;
        const existingTodo=TodoModel.find({_id:id,userId:userId});
        if (!existingTodo){
            return res.json({status:204,success:false,message:"No matching data found to update"});
        }
        await existingTodo.updateOne({status:status});
        return res.json({status:201,success:true,message:"Data updated successfully"});

    }
    catch(error){
        console.log("Error while updatong the todo");
        console.log(error)
        return res.json({status:500,success:true,message:"An error occurred while updating data"});

    }
}