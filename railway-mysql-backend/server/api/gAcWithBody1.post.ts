import { success } from 'zod'
import { getConnection } from '../utils/db'

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event)
    const userId = body.userId
    const inviteId = body.inviteId
    const connection = await getConnection()
    await connection.execute(
      ` INSERT INTO gameRecord (userId, inviteId) VALUES ('${userId}', '${inviteId}');`,

    )
    await connection.execute(
      ` INSERT INTO commission (userId, inviteId) VALUES ('${userId}', '${inviteId}');`,
    )
    return {
      sqlGameRecord: ` INSERT INTO gameRecord (userId, inviteId) VALUES ('${userId}', '${inviteId}');`,
      sqlCommission: ` INSERT INTO commission (userId, inviteId) VALUES ('${userId}', '${inviteId}');`,
    }
  } catch (error) {
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }
  }
})