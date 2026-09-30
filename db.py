import motor.motor_asyncio
from config import Config

class Database:
    def __init__(self):
        self.client = motor.motor_asyncio.AsyncIOMotorClient(Config.DB_URL)
        self.db = self.client[Config.DB_NAME]
        self.users = self.db['users']

    async def save_subscriber(self, user_id):
        await self.users.update_one(
            {'user_id': user_id},
            {'$set': {'user_id': user_id}},
            upsert=True
        )

    async def get_appx_api(self):
        doc = await self.db['appx_api'].find_one()
        return doc.get('apis', {}) if doc else {}

db_instance = Database()
