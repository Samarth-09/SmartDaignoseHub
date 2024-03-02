import mongoose from "mongoose";

const diseaseSchema = new mongoose.Schema({
  name: {
    type: String,
    require: true,
  },
  dateOfCheck: String,
  reportValues: [Number],
  output: Boolean,
});

const userSchema = new mongoose.Schema({
  uname: {
    type: String,
    require: true,
  },
  email: {
    type: String,
    require: true,
    unique: true,
  },
  pwd: {
    type: String,
    require: true,
  },
  feedBack: String,
  rating: Number,
  dieseasesHistory: [diseaseSchema],
});
// diseaseSchema.methods.setDate = function () {
//   this.dateOfCheck = new Date().toISOString().slice(0, 10);
// };
diseaseSchema.methods = {
  setDate: function () {
    this.dateOfCheck = new Date().toISOString().slice(0, 10);
  },
};

const userModel = mongoose.model("users", userSchema);
const diseaseModel = mongoose.model("diseases", diseaseSchema);

export default userModel;
export { diseaseModel };
