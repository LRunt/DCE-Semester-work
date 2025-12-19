import { createI18n } from 'vue-i18n'
import cs from './locales/cs'
import en from './locales/en'

const messages = {
    cs,
    en
}

const i18n = createI18n({
    legacy: false,
    locale: 'cs',
    fallbackLocale: 'en',
    messages
})

export default i18n