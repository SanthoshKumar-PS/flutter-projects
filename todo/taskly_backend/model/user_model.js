const mongoose=require('mongoose');
const bcrypt=require('bcrypt');

const UserSchema = new mongoose.Schema({
    email:{
        type: String,
        required:true,
        lowercase: true,
        unique:true,
        trim: true
    },
    name:{
        type:String,
        required:true,
        trim:true
    },
    password:{
        type:String,
        required:true,
        trim:true
    }
})

UserSchema.pre('save',async function(){
    const salt=await bcrypt.genSalt(10)
    const hashedPassword=await bcrypt.hash(this.password,salt)
    this.password=hashedPassword 
 
})

const UserModel = mongoose.model('UserCred',UserSchema)
module.exports = UserModel;