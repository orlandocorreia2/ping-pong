const express = require("express");
const app = express();
const port = 3000;

app.get("/ping", (_, res) => {
  res.json({ message: "pong" });
});

app.listen(port, () => {
  console.log(`App example is running on port: ${port}`);
});
