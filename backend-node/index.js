import express from "express";
import bodyParser from "body-parser";
import mlModelRouter from "./ML_Model/ml_model.js";
import userRouter from "./routes/userRoutes.js";
import mongoose from "mongoose";
import * as env from "dotenv";
env.config();
const app = express();

//parse data in the form of json
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use((req, res, next) => {
  // Set CORS headers to allow cross-origin requests (required to communicate with flutter thorugh localhosting)
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Credentials", "true");
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
  );
  res.setHeader(
    "Access-Control-Allow-Methods",
    "POST, OPTIONS, PUT, GET, DELETE"
  );
  next();
});

try {
  mongoose.connect(process.env.MONGO_CONNECTION_URL).then(() => {
    console.log("connected");
  });
} catch (e) {
  console.log(e);
}

//requests coming on /predict will go to the ml_model module for the service
app.use("/predict", mlModelRouter);

app.use("/user", userRouter);
//set port number dynamically on the basis of the enviornment(hosting env)
const port = process.env.PORT || 3001;
app.listen(port, () => {
  console.log("started" + port);
});

// const cron = require('node-cron');

// // In-memory counter (replace this with a database)
// let counter = 0;

// // Task to be executed every month
// const monthlyTask = () => {
//   // Increment the counter
//   counter++;

//   // Perform any other tasks you want to do monthly

//   console.log(`Counter incremented to: ${counter}`);
// };

// // Schedule the task to run at midnight on the first day of every month
// cron.schedule('0 0 1 * *', monthlyTask);

// console.log('Monthly counter script is running...');
