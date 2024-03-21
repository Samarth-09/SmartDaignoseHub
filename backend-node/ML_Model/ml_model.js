import express from "express";
import axios from "axios";
import {
  generateToken,
  getToken,
  checkToken,
  getData,
} from "../authentication/jwtHandler.js";
import { updateUser } from "../mongo/mongoApi.js";
const router = express.Router();
// const baseUrl = "https://smartdaignosehub.onrender.com";
const baseUrl = "http://127.0.0.1:5000";
router.post("/diabetes", async (req, res) => {
  if (req.headers.authorization != null) {
    var token = req.headers.authorization.split(" ")[1];
    if (checkToken(token)) {
      try {
        var values = req.body.values;
        const response = await axios.post(`${baseUrl}/diabetes`, {
          values: values,
        });
        if (
          await updateUser({
            email: await getData(token).email,
            name: "Diabetes",
            values: values,
            output: response.data.outcome,
          })
        ) {
          res.json(response.data);
        } else {
          res.json({ outcome: -1 });
        }
      } catch (error) {
        console.log(error);
        res.json({ outcome: -2 });
      }
    } else {
      res.json({ outcome: -3 });
    }
  } else {
    res.json({ outcome: -4 });
  }
});

router.post("/heartDieases", async (req, res) => {
  if (req.headers.authorization != null) {
    var token = req.headers.authorization.split(" ")[1];
    if (checkToken(token)) {
      try {
        var values = req.body.values;
        const response = await axios.post(`${baseUrl}/heartDieases`, {
          values: values,
        });
        if (
          await updateUser({
            email: await getData(token).email,
            name: "Heart Disease",
            values: values,
            output: response.data.outcome,
          })
        ) {
          res.json(response.data);
        } else {
          res.json({ outcome: -1 });
        }
      } catch (e) {
        res.json({ outcome: -1 });
      }
    } else {
      res.json({ outcome: -1 });
    }
  } else {
    res.json({ outcome: -2 });
  }
});

router.post("/parkinson", async (req, res) => {
  if (req.headers.authorization != null) {
    var token = req.headers.authorization.split(" ")[1];
    if (checkToken(token)) {
      try {
        var values = req.body.values;
        const response = await axios.post(`${baseUrl}/parkinson`, {
          values: values,
        });
        if (
          await updateUser({
            email: await getData(token).email,
            name: "Parkinson",
            values: values,
            output: response.data.outcome,
          })
        ) {
          res.json(response.data);
        } else {
          res.json({ outcome: -1 });
        }
      } catch (e) {
        res.json({ outcome: -1 });
      }
    } else {
      res.json({ outcome: -1 });
    }
  } else {
    res.json({ outcome: -2 });
  }
});

export default router;
