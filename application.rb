require "sinatra/base"

class Application < Sinatra::Base
  get '/' do
    erb :index
  end
end

module WebExtension1
  def self.registered(app)
    app.helpers do
      def find_template(view, *a, &b)
        dir = File.expand_path("../views_ext1/", __FILE__)
        super(dir, *a, &b)
        super
      end
    end

    app.get '/ext1' do
      erb :ext1
    end
  end
end

module WebExtension2
  def self.registered(app)
    app.helpers do
      def find_template(view, *a, &b)
        dir = File.expand_path("../views_ext2/", __FILE__)
        super(dir, *a, &b)
        super
      end
    end

    app.get '/ext2' do
      erb :ext2
    end
  end
end

Application.register WebExtension1
Application.register WebExtension2
