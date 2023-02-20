// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// INIT
const PORT = process.env.PORT || 5000;
const app = express();
const DB =
"mongodb://nawal:nawal@ac-kak1cvj-shard-00-00.bholp4d.mongodb.net:27017,ac-kak1cvj-shard-00-01.bholp4d.mongodb.net:27017,ac-kak1cvj-shard-00-02.bholp4d.mongodb.net:27017/?ssl=true&replicaSet=atlas-7sewvn-shard-0&authSource=admin&retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
