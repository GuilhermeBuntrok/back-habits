import Fastify from "fastify";
import cors from '@fastify/cors'
import { appRoutes } from "./routes";



const app = Fastify()

const ports = 4000

const port = process.env.Port || !4000

app.register(cors)

app.register(appRoutes)

app.listen({
  port: ports

}).then(() => {
  console.log('🚀 Server ready at')
})