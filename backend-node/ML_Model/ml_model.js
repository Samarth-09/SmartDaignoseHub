import express from "express";
import axios from "axios";
import {
  generateToken,
  getToken,
  checkToken,
  getData,
} from "../authentication/jwtHandler.js";
const router = express.Router();
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
        res.json(response.data);
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

router.post("/heartDieases", async (req, res) => {
  if (req.headers.authorization != null) {
    var token = req.headers.authorization.split(" ")[1];
    if (checkToken(token)) {
      try {
        var values = req.body.values;
        const response = await axios.post(`${baseUrl}/heartDieases`, {
          values: values,
        });
        res.json(response.data);
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
        res.json(response.data);
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
