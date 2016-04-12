require 'sinatra'
require 'bundler'
require 'sinatra/assetpack'
require 'sinatra/support'
require 'sinatra/partial'
require 'compass'
require 'haml'

class App < Sinatra::Base
    set :root, File.dirname(__FILE__)  # Must be set

    # Module Registration
    register Sinatra::Partial
    register Sinatra::CompassSupport
    register Sinatra::AssetPack

    # Asset Management
    # Compass
    sass_dir = File.join(File.dirname(__FILE__), 'assets/css')
    Compass.configuration do |c|
        c.project_path = root
        c.images_dir = "assets/images"
        c.http_generated_images_path = "/images" # necessary for sprite generation
        c.http_images_path = "/images"
        c.cache_dir = 'tmp/sass-cache' # optional
        c.sass_options = { 
        load_paths: [sass_dir] + Compass.sass_engine_options[:load_paths] } # necessary if using SASS partials
    end
 
    set :scss, Compass.sass_engine_options # necessary if using SASS partials
 
    assets {
        serve '/js',     from: 'assets/js'
        serve '/css',    from: 'assets/css'
        serve '/images', from: 'assets/images'
 
        js :app, [
          '/js/*.js'
        ]
 
        css :app, [
            '/css/app.css'
        ]
 
        js_compression  :jsmin
        css_compression :sass
     }

    ################################################
    # Routes go here - do not touch above          #
    ################################################
    get '/' do
       haml :index, :locals => { :name => 'some dude'}
    end
end

