const TodoModel=require('../model/todo_model')

exports.addNewTodo =async function(req,res) {
    try {
        const {userId,category,title,description,notes}=req.body;
        const existingTitle=await TodoModel.findOne({userId,title});
        if (existingTitle){
            return res.json({status:409,success:false, message:"Title name already exists"})
        }

        const newTodo=await TodoModel({userId,category,title,description,notes});
        await newTodo.save();
        return res.json({status:201,success:true, message:"New Todo List has been created"})

        
    } catch (error) {
        console.log("Some error has occured while creating New Todo List");
        return res.json({status:404, success:false, message:"Some error occured"})

    }
}