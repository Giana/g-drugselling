local Translations = {
    error = {
        not_enough = 'You do not have enough to sell.',
        cannot_sell = 'You cannot sell right now.'
    },
    info = {
        police_alert = 'Drug sale in progress',
        selling = 'Selling...'
    },
    other = {
        target_label = 'Sell'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})