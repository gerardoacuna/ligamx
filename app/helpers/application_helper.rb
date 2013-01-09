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

  def google_analytics_tag
  	javascript_tag do
		  "var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-37521614-1']);
		  _gaq.push(['_trackPageview']);
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();"
		end
  end

end
