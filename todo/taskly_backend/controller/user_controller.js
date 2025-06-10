const UserCred=require('../model/user_model')
const jwt=require('jsonwebtoken')
const bcrypt=require('bcrypt')
exports.registerUser=async function(req,res){
    try{
        const {email,name,password}=req.body
        const existingUser= await UserCred.findOne({email});
        if(existingUser){
            return res.json({success:false,status:409,message:"User already exists",result:null});
        }
        const newUser=UserCred({email,name,password});
        await newUser.save();
        const token=jwt.sign({_id:newUser._id,email:newUser.email,name:newUser.name},'959788',{expiresIn:'1h'})

        return res.json({success:true,status:201,message:`${email} was successfully registered`,result:token});
    }
    catch(error){
        console.log(error.message)
    }
}

exports.loginUser=async function(req,res){
    try {
        const {email,password}=req.body;
        const existingUser=await UserCred.findOne({email});
        if(!existingUser){
            return res.json({success:false, status:404, message:"User does not exist", result:null});
        }
        const isMatchPassword=await bcrypt.compare(password,existingUser.password);
        if (!isMatchPassword){
            return res.json({success:false, status:401, message:"Password Mismatched", result:null});
        }

        const token=jwt.sign({_id:existingUser._id,email:existingUser.email,name:existingUser.name},'959788',{expiresIn:'1h'});
        return res.json({success:true,status:200, message:"Login Success", result:token});

    } catch (error) {
        console.log(error);        
    }
}