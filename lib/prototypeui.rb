# Prototypeui

module ActionView #:nodoc:
  module Helpers #:nodoc:
    module PrototypeuiHelper
    
      def pui_css_theme(theme, options = {})
        output = []
        css_files = [ 
          'window/window',
          'window/leopard',
          'shadow/mac_shadow',
          'context_menu/context_menu',
          'context_menu/leopard',
          'auto_complete/mac_os_x',
          'shadow/drop_shadow',
          'calendar/calendar',
          'calendar/mac_os_x'
        ]

        css_files_with_path = []
        css_files.each {|css_file| 
        #  output << stylesheet_link_tag('prototype-ui/'+css_file, options)
          css_files_with_path << 'prototype-ui/'+css_file
        }
        options[:cache]=false

        output << stylesheet_link_tag(css_files_with_path, options)
        output * "\n"
      end
       
      def link_to_window(name, options = {}, html_options = nil)
        javascript_options = options_for_ajax(options)
        
        function = "new UI.Window("
        url_options = options[:url]
        url_options = url_options.merge(:escape => false) if url_options.is_a?(Hash)

        function << "#{options_for_pui_window(options)}" 
        function << ")"
        function << ".setHeader('test')"
        function << ".center().setAjaxContent("
        function << "'#{url_for(url_options)}'"
        function << ", #{javascript_options})"
       
        function << ".show();return false;"
        
        #{theme: 'leopard', shadow: true, width:  200, height: 150}).center().setAjaxContent('#{url_for(url_options)}',"+options_for_ajax({})+").show();return false;"
           
        link_to_function(name, function, html_options || options.delete(:html)) 
      end
      
      def pui_group(options = {}, &block)
        if block_given?
          content = capture(&block)
          concat('<div'+(options[:css]?' class="'+options[:css]+'"':'')+'>'+
            '<div class="group">'+
              '<div class="group_nw"><div class="group_ne"><div class="group_n"></div></div></div>', block.binding)
          if options[:title]
            concat('<div class="group_title_w"><div class="group_title_e"><h1 class="group_title">'+options[:title]+'</h1></div></div>', block.binding)
          end
          concat('<div class="group_w"><div class="group_e"><div class="group_content">', block.binding)
          concat(content, block.binding)
          concat('</div></div></div>'+
            '<div class="group_sw"><div class="group_se"><div class="group_s"></div></div></div></div>', block.binding)
        else
          
        end
      end
      
    protected
      def options_for_pui_window(options)
        js_options = {}
        
        options.each{|key,option|
          js_options[key]="'#{option}'"
        }
        
        options_for_javascript(js_options)
      end
    end
  end
end
