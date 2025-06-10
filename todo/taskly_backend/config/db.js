const mongoose=require('mongoose');

const connectDB= async function(){
    try {
        await mongoose.connect(
            'mongodb://localhost:27017/taskly'
        );
        console.log("Taskly Database is connected");
    }
     catch (error) {
        
    }
}

module.exports =connectDB;