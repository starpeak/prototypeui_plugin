require 'fileutils'

# Uninstall all the needed support files (CSS and JavaScript)

js_dir = File.dirname(__FILE__) + '/../../../public/javascripts/'
prototypeui_js = js_dir + 'prototype-ui.js'
lang_dir = js_dir + 'lang'
prototypeui_css = File.dirname(__FILE__) + '/../../../public/stylesheets/prototype-ui'

FileUtils.rm prototypeui_js 
#FileUtils.rm_r lang_dir
FileUtils.rm_r prototypeui_css 
