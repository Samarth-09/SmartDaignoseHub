import mongoose from "mongoose";
import userModel, { diseaseModel } from "../Data_Model/user.js";

async function saveUser(data) {
  try {
    const user = new userModel({
      uname: data.uname,
      email: data.email,
      pwd: data.pwd,
      feedBack: data.feedBack,
      rating: data.rating,
      dieseasesHistory: data.dieseasesHistory,
    });
    const result = await user.save();
    // console.log(result);
    if (result) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    //console.log(e);
    return false;
  }
}

async function readUser(e) {
  try {
    const result = await userModel.find({ email: e });
    if (result) {
      return result[0];
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

async function deleteUser(user) {}

async function updateUser(data) {
  try {
    const newDisease = new diseaseModel({
      name: data.name,
      dateOfCheck: "",
      reportValues: data.values,
      output: data.output == 1 ? true : false,
    });
    newDisease.setDate();
    await userModel.updateOne(
      { email: data.email },
      { $push: { dieseasesHistory: newDisease } }
    );
    return true;
  } catch (error) {
    console.log(error);
    return false;
  }
}

export { saveUser, readUser, deleteUser, updateUser };
