//imports
const express= require('express');
const mongoose = require('mongoose');

//import from other files
const authRouter =require("./routes/auth");
const app= express();
const DB="mongodb+srv://najla:Najla1412%40@cluster0.9mfwuwi.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);


//initialisations
const PORT=3000;

//create an api

app.get('/hello-world', (req, res) => {
    res.json({hi:"hello khra"});
})

//Connections
mongoose.connect(DB).then(()=> {
    console.log('Connection Successful');
    }).catch(e=>{
        console.log(e);
    });
app.listen(PORT, "0.0.0.0", () => {
    console.log('connected at port '+ PORT);
});
