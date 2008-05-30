require 'fileutils'

# Install all the needed support files (CSS and JavaScript)

js_dir = File.dirname(__FILE__) + '/../../../public/javascripts/'
prototypeui_js = js_dir + 'prototype-ui.js'
lang_dir = js_dir + 'lang'
prototypeui_css = File.dirname(__FILE__) + '/../../../public/stylesheets/prototype-ui'

FileUtils.cp File.dirname(__FILE__) + '/public/javascripts/prototype-ui.js', prototypeui_js  unless File.exists?(prototypeui_js)
#FileUtils.cp_r File.dirname(__FILE__) + '/../public/javascripts/lang/', lang_dir unless File.exists?(lang_dir)
FileUtils.cp_r File.dirname(__FILE__) + '/public/stylesheets/prototype-ui', prototypeui_css unless File.exists?(prototypeui_css)