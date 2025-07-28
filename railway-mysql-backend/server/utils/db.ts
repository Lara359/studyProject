import mysql from 'mysql2/promise'
import dotenv from 'dotenv'

dotenv.config()

let connection: mysql.Connection | null = null

export async function getConnection() {
  if (!connection) {
    connection = await mysql.createConnection({
      host: process.env.DATABASE_HOST,
      port: parseInt(process.env.DATABASE_PORT || '3306'),
      database: process.env.DATABASE_NAME,
      user: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
    })
  }
  return connection
}

export async function closeConnection() {
  if (connection) {
    await connection.end()
    connection = null
  }
}