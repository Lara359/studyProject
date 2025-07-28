import { getConnection } from '../utils/db'

export default defineEventHandler(async (event) => {
  try {
    const connection = await getConnection()
    const [rows] = await connection.execute(
      'SELECT * FROM messages ORDER BY created_at DESC LIMIT 50'
    )
    return {
      success: true,
      messages: rows
    }
  } catch (error) {
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }
  }
})