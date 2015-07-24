# This imports all the layers for "viewer" into viewerLayers
lmv = Framer.Importer.load "imported/viewer"
pin_l = 0
pin_r = 0
pin_t = 0
opt1_l = 0


# Hotspot
# leftSpot = new Layer({x:-55, y:45, width: 55, height: 450, backgroundColor: "lime", opacity:0.2})



# Left Nav

# Set initial states
lmv.Right.opacity = 1
lmv.Sub_viewable.opacity = 0
lmv.pin_left.opacity = 0.5
lmv.pin_right.opacity = 0.2
lmv.pin_top.opacity = 0.5
lmv.unpin_left.opacity = 0
lmv.unpin_top.opacity = 0
lmv.unpin_right.opacity = 0
lmv.Spots.visible = true
lmv.Spots.opacity = 0



for layer, index in lmv.left_init.subLayers
	layer.opacity = 0.5

for layer, index in lmv.left_selected.subLayers
	layer.opacity = 0



# Add States
lmv.viewer_cube.states.add
	expand: {x:1260, y:80}

lmv.pinLeft.states.add
	init: {height:45}
	close: {height:1} 

lmv.pinRight.states.add
	init: {height:45}
	close: {height:1} 

lmv.Sub_viewable.states.add
	init: {x:40, opacity:1} 

lmv.d_selected.states.add
	second: {opacity:1}		
	
lmv.pin_left.states.add
	second: {opacity:1}			
	
lmv.File_Types.states.add
	init: {x:0, opacity:1}
	slide: {x:-50, opacity:0}	

lmv.Right.states.add
	slide: {x:1200, opacity:0}		
 
lmv.Main.states.add
	init: {y:0, opacity:1}
	slide: {y:-50, opacity:0}		

# Toggle states
lmv.TopSpot.on Events.MouseOver, ->
	if pin_t == 1 && opt1_l == 1
		lmv.Main.states.switch("init")
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("init")
		lmv.Right.states.switch("default")

	else if pin_t == 1 && opt1_l != 1
		lmv.Main.states.switch("init")
		lmv.File_Types.states.switch("init")
		lmv.Right.states.switch("default")
		
	if pin_t == 0 && opt1_l == 1
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("init")
		lmv.Right.states.switch("default")

	else if pin_t == 0 && opt1_l != 1
		lmv.File_Types.states.switch("init")
		lmv.Right.states.switch("default")
			
			
lmv.TopSpot.on Events.MouseOut, ->
	if pin_t == 1 && pin_r ==1 && pin_l ==1
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
	else if pin_t == 1 && pin_r ==0 && pin_l ==1
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
	else if pin_t == 1 && pin_r ==1 && pin_l ==0
		lmv.Main.states.switch("slide")
		lmv.Right.states.switch("slide")	
					
	else if pin_t == 0 && pin_r ==1 && pin_l ==1
		
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
	else if pin_t == 0 && pin_r ==0 && pin_l ==1
		
		lmv.File_Types.states.switch("slide")
	else if pin_t == 0 && pin_r ==1 && pin_l ==0
		
		lmv.Right.states.switch("slide")	

				
lmv.RightSpot.on Events.MouseOut, ->
	if pin_r == 1
		lmv.Right.states.switch("slide")
		
lmv.RightSpot.on Events.MouseOver, ->
	if pin_r == 1
		lmv.Right.states.switch("default")

lmv.Containerspot.on Events.MouseOver, ->
	if pin_l == 1
		lmv.Sub_viewable.x = 40		
		lmv.File_Types.states.switch("init")
						

lmv.Containerspot.on Events.MouseOut, ->
	if pin_l == 1
		lmv.Sub_viewable.x = -300			
		lmv.File_Types.states.switch("slide")
			
			

lmv.designSpot.on Events.MouseOver, ->	
	lmv.d_init.opacity = 1	
	lmv.File_Types.states.switch("init")
	
	if opt1_l == 1
	 	lmv.Sub_viewable.states.switchInstant("init")
	
lmv.designSpot.on Events.MouseOut, ->		
	lmv.d_init.opacity = 0.5	
		
lmv.designSpot.on Events.Click, ->
	if opt1_l == 0			
		lmv.d_selected.states.next()
		lmv.d_init.states.next()
		lmv.Sub_viewable.states.next()
		opt1_l = 1
	else 		
		lmv.d_selected.states.next()
		lmv.d_init.states.next()
		lmv.Sub_viewable.states.next()
		lmv.Containerspot.width = 100
		opt1_l = 0	


lmv.pinTop.on Events.MouseOver, ->
		
	if pin_t == 0
		lmv.pin_top.opacity = 1
		lmv.tooltip_unpin_top.visible = true
		lmv.tooltip_unpin_top.opacity = 1
		lmv.Main.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.File_Types.states.switch("init")
		
	else if pin_t == 1
		lmv.unpin_top.opacity = 1
		lmv.pin_top.opacity = 0
		lmv.tooltip_pin_top.visible = true
		lmv.tooltip_pin_top.opacity = 1
		lmv.Main.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.File_Types.states.switch("init")
	
lmv.pinTop.on Events.MouseOut, ->
	if pin_t == 0	
		lmv.pin_top.opacity = 0.5	
		lmv.tooltip_unpin_top.opacity = 0
				
	else
		lmv.unpin_top.opacity = 0.5
		lmv.pin_top.opacity = 0
		lmv.tooltip_pin_top.opacity = 0


lmv.pinTop.on Events.Click, ->	
	if pin_t == 0	
		lmv.pin_top.opacity = 0
		lmv.unpin_top.visible = true	
		lmv.unpin_top.opacity = 1	
		lmv.tooltip_unpin_top.opacity = 0
		
		lmv.pin_left.opacity = 0
		lmv.unpin_left.visible = true	
		lmv.unpin_left.opacity = 0.5	
		
		lmv.pin_right.opacity = 0
		lmv.unpin_right.visible = true	
		lmv.unpin_right.opacity = 0.2	
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		pin_l = 1
		pin_t = 1
		pin_r = 1
			
		
	else if pin_t == 1
		lmv.pin_top.opacity = 1
		lmv.unpin_top.visible = false
		lmv.tooltip_pin_top.opacity = 0
		
		lmv.pin_left.opacity = 0.5
		lmv.unpin_left.visible = false
		lmv.tooltip_pin_left.opacity = 0		
		lmv.pin_right.opacity = 0.2
		lmv.unpin_right.visible = false
		lmv.tooltip_pin_right.opacity = 0				
		pin_t = 0
		pin_l = 0
		pin_r = 0	



lmv.pinLeft.on Events.MouseOver, ->
		
	if pin_l == 0
		lmv.pin_left.opacity = 1
		lmv.tooltip_unpin_left.visible = true
		lmv.tooltip_unpin_left.opacity = 1
		lmv.File_Types.states.switch("init")
		
	else if pin_l == 1 && opt1_l == 1
		lmv.Sub_viewable.states.switchInstant("init")
		lmv.unpin_left.opacity = 1
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.visible = true
		lmv.tooltip_pin_left.opacity = 1
		lmv.File_Types.states.switch("init")	

	else if pin_l == 1 && opt1_l != 1		
		lmv.unpin_left.opacity = 1
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.visible = true
		lmv.tooltip_pin_left.opacity = 1
		lmv.File_Types.states.switch("init")				
		

	


lmv.pinLeft.on Events.MouseOut, ->
	if pin_l == 0	
		lmv.pin_left.opacity = 0.5	
		lmv.tooltip_unpin_left.opacity = 0
		
		
	else
		lmv.unpin_left.opacity = 0.5
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.opacity = 0
		

lmv.pinLeft.on Events.Click, ->	
	if pin_l == 0	
		lmv.pin_left.opacity = 0
		lmv.unpin_left.visible = true	
		lmv.unpin_left.opacity = 1	
		lmv.tooltip_unpin_left.opacity = 0
		
		pin_l = 1
			
		
	else if pin_l == 1
		lmv.pin_left.opacity = 1
		lmv.unpin_left.visible = false
		lmv.tooltip_pin_left.opacity = 0	
		pin_l = 0		
	
lmv.pinRight.on Events.MouseOver, ->
		
	if pin_r == 0
		lmv.pin_right.opacity = 1
		lmv.tooltip_unpin_right.visible = true
		lmv.tooltip_unpin_right.opacity = 1
		lmv.Right.states.switch("default")
		
	else if pin_r == 1 
		lmv.unpin_right.opacity = 1
		lmv.pin_right.opacity = 0
		lmv.tooltip_pin_right.visible = true
		lmv.tooltip_pin_right.opacity = 1
		lmv.Right.states.switch("default")	
			
		

	


lmv.pinRight.on Events.MouseOut, ->
	if pin_r == 0	
		lmv.pin_right.opacity = 0.2	
		lmv.tooltip_unpin_right.opacity = 0
		
		
	else
		lmv.unpin_right.opacity = 0.2
		lmv.pin_right.opacity = 0
		lmv.tooltip_pin_right.opacity = 0
		

lmv.pinRight.on Events.Click, ->	
	if pin_r == 0	
		lmv.pin_right.opacity = 0
		lmv.unpin_right.visible = true	
		lmv.unpin_right.opacity = 1	
		lmv.tooltip_unpin_right.opacity = 0
		
		pin_r = 1
			
		
	else if pin_r == 1
		lmv.pin_right.opacity = 1
		lmv.unpin_right.visible = false
		lmv.tooltip_pin_right.opacity = 0	
		pin_r = 0	



		
# Set the animation options    
lmv.Sub_viewable.states.animationOptions = 
    curve: "ease-in-out"
    time: .1   

lmv.Main.states.animationOptions = 
    curve: "ease-in-out"
    time: .1   
    
lmv.File_Types.states.animationOptions = 
    curve: "ease-in-out"
    time: .1       
    
lmv.Right.states.animationOptions = 
    curve: "ease-in-out"
    time: .15       
    
lmv.d_selected.states.animationOptions = 
    curve: "ease-in-out"
    time: 0   

lmv.d_init.states.animationOptions = 
    curve: "ease-in-out"
    time: 0 		
    
lmv.pin_left.states.animationOptions = 
    curve: "ease-in-out"
    time: 0  
    
lmv.tooltip_unpin_left.states.animationOptions = 
    curve: "ease-in-out"
    time: 0.2         