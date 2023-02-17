local Translations = {
    error = {
        not_enough = 'You do not have enough of: %{itemLabel}'
    },
    info = {
        police_alert = 'Drug sale in progress'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})