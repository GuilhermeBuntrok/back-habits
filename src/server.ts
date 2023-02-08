import Fastify from "fastify";
import cors from '@fastify/cors'
import { appRoutes } from "./routes";
import dotenv from "dotenv";



dotenv.config()

const port: any = process.env.PORT || 8000;

const app = Fastify()


app.register(cors)

app.register(appRoutes)

app.listen({
  port: port,
  host: "0.0.0.0",

}).then(() => {
  console.log('🚀 Server ready at')
})

