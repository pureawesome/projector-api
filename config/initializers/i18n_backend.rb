TRANSLATION_STORE = Redis.new(db:0)

I18n.backend = I18n::Backend::Chain.new(
                I18n::Backend::KeyValue.new(TRANSLATION_STORE),
                I18n.backend)
