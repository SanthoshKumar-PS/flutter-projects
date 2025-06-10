const TodoModel=require('../model/todo_model')

exports.fetchUserTodos= async function(req,res){
    try {
        const {userId}=req.query 
         if (!userId) {
            return res.json({status: 400,success: false,message: "Missing userId parameter",
        todos: null,
      });
    }
        const allUserTodos=await TodoModel.find({userId:userId})
        res.json({status:200,success:true,message:"Fetched all todos",todos:allUserTodos});
        
    } catch (error) {
        console.log("Error occured at fetching all todos",error)
        res.json({status:404,success:false,message:"Error occured while fetching todos",todos:null});

    }
}