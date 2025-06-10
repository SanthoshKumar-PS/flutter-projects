const TodoModel=require('../model/todo_model')

exports.deleteUserTodo= async function(req,res){
    try {
        const {todoId}=req.query
    const existingTodo = await TodoModel.findById({_id:todoId});
    if(!existingTodo){
        return res.json({status:404,success:false,message:"This todo couldn't be deleted"});
    }
    await TodoModel.findByIdAndDelete({_id:todoId});
    return res.json({status:200,success:true,message:"Todo deleted successfully"});
    } catch (error) {
        console.log("Some error occurred while deleting a todo")
        return res.json({status:500,success:false,message:"Internal Server Error"});

    }
}