#Rails.application.config.assets.paths << Rails.root.join("vendor","assets","iCheck","minimal")
Rails.application.config.assets.precompile += %w( iCheck/minimal/minimal.png )