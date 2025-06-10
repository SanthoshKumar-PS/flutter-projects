const mongoose=require('mongoose')
const UserModel = require('./user_model')
const { Schema } = mongoose

const TodoSchema = new mongoose.Schema({
    userId:{
        type:Schema.Types.ObjectId,
        ref:UserModel.modelName,
        required:true
    },

    category:{
        type:String,
        enum:['Educational','Grocery','Work-Related','Home-Related','Personal'],
        default:'Personal',
        lower:true
    },

    title:{
        type:String,
        required:true
    },

    description:{
        type:String,
        required:true
    },

    notes: {
        type:String,
    },

    status:{
        type:String,
        enum:['pending','completed'],
        default:'pending'
    }
});

const TodoModel=mongoose.model('TodoTasks',TodoSchema);
module.exports=TodoModel;