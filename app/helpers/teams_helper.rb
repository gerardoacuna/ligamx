module TeamsHelper

	def set_active_to_first(i)
		css_classes = ['tab']
    css_classes << 'active' if i == 0
    css_classes
	end
	
end
