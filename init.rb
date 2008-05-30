require 'prototypeui'

#include prototype-ui.js to javascript_include_tag
ActionView::Helpers::AssetTagHelper::register_javascript_include_default 'prototype-ui'

#define rhtml commands
ActionView::Base.send :include, ActionView::Helpers::PrototypeuiHelper
#ActionView::Helpers::AssetTagHelper.send :include, PUI::AssetTagHelper
