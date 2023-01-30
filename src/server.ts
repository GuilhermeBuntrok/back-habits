import Fastify from "fastify";
import cors from '@fastify/cors'
import { appRoutes } from "./routes";



const app = Fastify()

const port = process.env.Port || 4000

app.register(cors)

app.register(appRoutes)

app.listen({
  port: 3000

}).then(() => {
  console.log('🚀 Server ready at')
})