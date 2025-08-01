import { getConnection } from '../utils/db'

export default defineEventHandler(async (event) => {
    try {
        const body = await readBody(event)
        return {
            body
        }
    } catch (error) {
        return {
            success: false,
            error: error instanceof Error ? error.message: 'Unknown error'
        }
    }
})