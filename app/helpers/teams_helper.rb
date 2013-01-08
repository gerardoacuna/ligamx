module TeamsHelper

	def set_active_to_first(arg, i)
		css_classes = ['arg']
    css_classes << 'active' if i == 0
    css_classes
	end
end
