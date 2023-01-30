import Fastify from "fastify";
import cors from '@fastify/cors'
import { appRoutes } from "./routes";

const app = Fastify()

const port = process.env.PORT || 4000;

app.register(cors)
app.register(appRoutes)

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});