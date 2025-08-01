import { success } from 'zod'
import { getConnection } from '../utils/db'

export default defineEventHandler(async (event) => {
    try {
        const body = await readBody(event)
        const userId = body.userId
        const inviteId = body.inviteId

        return {
            sql: [
                ` INSER INTO gameRecord (userId,inviteId) VALUES ('${userId}','${inviteId}');`,
                ` INSER INTO commission (userId,inviteId) VALUES ('${userId}','${inviteId}');`
            ]

        }
    } catch (error) {
        return {
            success: false,
            error: error instanceof Error ? error : 'Unknown error'
        }
    }
})