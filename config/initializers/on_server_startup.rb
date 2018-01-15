module Youdo
  class OnServerStartup < Rails::Application
    if defined?(Rails::Server)
      config.after_initialize do
        User.reindex
        Post.reindex
      end
    end
  end
end
