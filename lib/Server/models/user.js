const mongoose = require('mongoose');
const userSchema= mongoose.Schema({
    name:{
    required: true,
    type: String,
    trim: true,
    },
    email:{
    required: true,
    type: String,
    trim: true,
    validate:{
        validator: (value)=>{
           const re=^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$;
            return value.match(re);
        },
        message: "Please enter a valid email address",
    },
    },
    password:{
    required: true,
    type: String,
    validate:{
            validator: (value) => {
                return value.length > 6;
            },
            message: "Password must be more than 6 characters long",
        },
    },
    address: {
    type: String,
    default: '',
    },
    type: {
    type: String,
    default; 'user',
    },

});

const User = mongoose.model("User",userSchemar);
module.exports = User;