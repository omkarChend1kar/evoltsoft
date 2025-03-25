import express from "express";
import apiRoutes from "./routes/api.js";
import cors from 'cors';
const app = express();

app.use(cors());
app.use(express.json());
app.use('/api/',apiRoutes);

const PORT = 3000; // Default to 3000 if no env variable

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});