async def handle_appx_free(bot, message, app_name, api):
    await message.edit_text(f"🌐 {app_name}\n\nAPI: {api}\n\nExtraction in progress...", reply_markup=None)
