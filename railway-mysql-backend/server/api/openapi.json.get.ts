import fs from 'fs'
import path from 'path'

export default defineEventHandler((event) => {
  const openApiPath = path.join(process.cwd(), 'server/openapi.json')
  const openApiContent = fs.readFileSync(openApiPath, 'utf8')
  
  event.node.res.setHeader('Content-Type', 'application/json')
  return JSON.parse(openApiContent)
})