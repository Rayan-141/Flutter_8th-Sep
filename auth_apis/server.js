const express = require('express');
const userRouter = require('./router/userRouter');
const cors = require('cors');

const app = express();

app.use(cors('*'));
app.use(express.json());
app.use('/users',userRouter);

app.listen(4000,()=>{
    console.log('Server is running on port 4000');
});
