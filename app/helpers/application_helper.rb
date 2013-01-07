module ApplicationHelper
	
	def gain_loss(value)
		if value > 0
			"gain"
		elsif value < 0
			"loss"
		else
		end	
	end

  def bugherd_include_tag
  	javascript_tag do
			"(function (d, t) {
	      var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];
	      bh.type = 'text/javascript';
	      bh.src = '//www.bugherd.com/sidebarv2.js?apikey=gbvl3iqjbjvotksbshxhug';
	      s.parentNode.insertBefore(bh, s);
	      })(document, 'script');"
  	end  
  end

end
