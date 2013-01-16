# simple_form Custom inputs chosen

 simple_form  自定义 input 还不错。

 在这里  simple_form 用到了chosen js


# simple_form Custom inputs

``` 
 # app/inputs/chosen_input.rb

 class ChosenInput < SimpleForm::Inputs::Base
  def input
  	# "$ #{@builder.text_field(attribute_name, input_html_options)}".html_safe 
  	@chosen_class = input_html_options[:chosen_class]
  	@url = input_html_options[:url]
    @strHt = "#<select data-placeholder='Choose a country...' style='width:350px;' url='#{@url}'  class='chzn-select #{@chosen_class}'  tabindex='2'><option value=''></option></select>"
    @strHt += "<script type='text/javascript'>chosen_load('#{@chosen_class}')</script>"
	@strHt.html_safe
  end
end
```