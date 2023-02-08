import Fastify from "fastify";
import cors from '@fastify/cors'
import { appRoutes } from "./routes";
import dotenv from "dotenv";

dotenv.config()

const PORT = process.env.PORT

const app = Fastify()


app.register(cors)

app.register(appRoutes)

app.listen({
  port: 3000,
  host: "0.0.0.0",

}).then(() => {
  console.log('🚀 Server ready at')
})

