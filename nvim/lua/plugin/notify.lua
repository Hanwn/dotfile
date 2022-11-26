local notify_status, notify = pcall(require, "notify")

if not notifu_status then
    return
end

notify.setup()

