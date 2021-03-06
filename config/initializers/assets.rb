# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( header.scss )
Rails.application.config.assets.precompile += %w( footer.scss )

#以下Userモデル CSS
Rails.application.config.assets.precompile += %w( user/devise.css )
Rails.application.config.assets.precompile += %w( user/show.scss )
Rails.application.config.assets.precompile += %w( user/edit.scss )
Rails.application.config.assets.precompile += %w( user/option.scss )

#以下Shopモデル CSS
Rails.application.config.assets.precompile += %w( shops.css )
Rails.application.config.assets.precompile += %w( shop/form.css )

#以下Tagsモデルの CSS
Rails.application.config.assets.precompile += %w( tags.scss )

#静的ページのCSS
Rails.application.config.assets.precompile += %w( static.css )