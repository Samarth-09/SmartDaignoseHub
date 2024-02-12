/*
const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const app = express();
const PORT = 3000;
const SECRET_KEY = 'your-secret-key';

app.use(bodyParser.json());

// Sample user data (in-memory for the sake of example)
const users = [
  { id: 1, username: 'user1', password: 'password1' },
  { id: 2, username: 'user2', password: 'password2' },
];

// Login route
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  const user = users.find((u) => u.username === username && u.password === password);

  if (!user) {
    return res.status(401).json({ error: 'Invalid username or password' });
  }

  // Generate JWT token
  const token = jwt.sign({ userId: user.id, username: user.username }, SECRET_KEY, { expiresIn: '1h' });

  res.json({ user, token });
});

// Protected route - requires valid JWT token
app.get('/protected', (req, res) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ error: 'Token not provided' });
  }

  // Verify the JWT token
  jwt.verify(token, SECRET_KEY, (err, decoded) => {
    if (err) {
      return res.status(401).json({ error: 'Invalid token' });
    }

    // Token is valid, proceed with protected action
    res.json({ message: 'This is a protected route', user: decoded });
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

*/

import Jwt, { decode } from "jsonwebtoken";
import * as env from "dotenv";
env.config();

 function generateToken(user) {
  process.env.TOKEN = Jwt.sign(user, process.env.OUR_SECRET_KEY);
}

function getToken() {
  return process.env.TOKEN;
}

 function checkToken(token) {
  var b;
  Jwt.verify(token, process.env.OUR_SECRET_KEY, (err, decoded) => {
    if (err) {
      b = false;
    }
    b = true;
  });
  return b;
}

 function getData(token) {
  var b;
  Jwt.verify(token, process.env.OUR_SECRET_KEY, (err, decoded) => {
    if (err) {
      b = null;
    }
    b = decoded;
  });
  return b;
}

export { generateToken, getToken, checkToken, getData };
