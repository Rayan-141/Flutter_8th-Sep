const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const router = express.Router();

router.post('/register', async (req,res)=>{
    try{
        const {name,username,email,password} = req.body;

        const existingUsername = await User.findUserByUsername(username);
        if(existingUsername){
            return res.status(400).json({error:"Username already exists!"});
        }

        const existingEmail = await User.findUserByEmail(email);
        if(existingEmail){
            return res.status(400).json({error:"Email already exists!"});
        }

        const hashedPassword = await bcrypt.hash(password,10);
        
        const newUser = await User.createUser({name,username,email,password:hashedPassword});
        res.status(201).json({message:'User created successfully', user:newUser});
    }catch(error){
        res.status(500).json({error:error.message});
    }
});

router.post('/login', async (req,res)=>{
    try{
        const {username,password} = req.body;
        const user = await User.findUserByUsername(username);
        if(!user){
            return res.status(404).json({message:'Invalid Username!!'});
        }

        const isMatch = await bcrypt.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({message:'Invalid Password!!'});
        }

        const token = jwt.sign(
            {
                userId: user.id,
                name: user.name,
                username: user.username,
                email: user.email,
            },
            "ITM",
            {expiresIn: "1h"},
        );
        res.status(200).json({message: 'Login successful',token});
    }catch(error){
        res.status(500).json({error:error.message});
    }
})

module.exports = router;

