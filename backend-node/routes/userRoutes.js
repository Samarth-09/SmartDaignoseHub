import Express from "express";
import {
  saveUser,
  readUser,
  deleteUser,
  updateUser,
} from "../mongo/mongoApi.js";
import {
  generateToken,
  getToken,
  checkToken,
  getData,
} from "../authentication/jwtHandler.js";
const router = Express.Router();
let currentUser = null;
router.get("/login", async (req, res) => {
  if (req.headers.authorization != null) {
    var token =  req.headers.authorization.split(" ")[1];
    if (checkToken(token)) {
      currentUser = await readUser(getData(token).email);
      res.json({ msg: true });
    } else {
      res.json({ msg: false });
    }
  } else {
    const userData = {
      email: req.query.email
    };
    generateToken(userData);
    const token = getToken();
    // console.log(token);
    // console.log(getData(token));
    if (checkToken(token)) {
      const user = await readUser(userData.email);
      if (user != null) {
        if(user.pwd == req.query.pwd)
        {
          res.json({ msg: token });
        }
        else{
          res.json({ msg: false });
        }
      } else {
        res.json({ msg: false });
      }
    } else {
      res.json({ msg: false });
    }
  }
});

router.get('/signup', async (req, res) => {
  const userData = {
    email: req.query.email,
  };
  // console.log(userData);
  generateToken(userData);
    const token = getToken();
    if (checkToken(token)) {
      const result = await saveUser(userData);
      //console.log(result);
      if (result) {
        currentUser = result;
        res.json(result);
      } else {
        res.json({ msg: false });
      }
    } else {
      res.json({ msg: false });
    }
});

router.get("/info", async (req, res) => {
  var token =  req.headers.authorization.split(" ")[1];
  if (checkToken(token)) {
    const user = await readUser(getData(token).email);
    if (user != null) {
      currentUser = user;
      res.json(user);
    } else {
      res.json({ msg: false});
    }
  } else {
    res.json({ msg: false });
  }
});

export default router;
