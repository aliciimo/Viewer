# This imports all the layers for "viewer responsive" into viewerResponsiveLayers
viewerResponsiveLayers = Framer.Importer.load "imported/viewer"

# This imports all the layers for "viewer" into viewerLayers
lmv = Framer.Importer.load "imported/viewer"
pin_l = 0
pin_r = 0
pin_t = 0
pin_b = 0
opt1_l = 0
opt1_b = 0
opt1_r = 1


# Hotspot
# leftSpot = new Layer({x:-55, y:45, width: 55, height: 450, backgroundColor: "lime", opacity:0.2})



# Left Nav

# Set initial states
lmv.Right.opacity = 1
lmv.Sub_viewable.opacity = 0
lmv.pin_left.opacity = 0.5
lmv.pin_right.opacity = 0.5
lmv.pin_bottom.opacity = 0.5
lmv.unpin_bottom.opacity = 0
lmv.pin_top.opacity = 0.5
lmv.unpin_left.opacity = 0
lmv.unpin_top.opacity = 0
lmv.unpin_right.opacity = 0
lmv.Spots.visible = true
lmv.Spots.opacity = 0
lmv.File_Types.x = 0
lmv.pan_2_box.opacity = 0 
lmv.close_sub.opacity = 0.5
lmv.User.opacity = 0.5	
lmv.Download.opacity = 0.5	
lmv.Share.opacity = 0.5	

for layer, index in lmv.bottom_init.subLayers
	layer.opacity = 0.5

for layer, index in lmv.right_init.subLayers
	layer.opacity = 0.5

for layer, index in lmv.right_selected.subLayers
	layer.opacity = 0
	
for layer, index in lmv.left_init.subLayers
	layer.opacity = 0.5

for layer, index in lmv.left_selected.subLayers
	layer.opacity = 0
	
lmv.info_selected.opacity = 1 

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

lmv.Bottom.states.add
	slide: {y:850, opacity:0}			
	
lmv.Main.states.add
	init: {y:0, opacity:1}
	slide: {y:-50, opacity:0}		

# Toggle All by Top
lmv.TopSpot.on Events.MouseOver, ->
	if pin_t == 1 && opt1_l == 1
		lmv.Main.states.switch("init")
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.Bottom.states.switch("default")
		

	else if pin_t == 1 && opt1_l != 1
		lmv.Main.states.switch("init")
		lmv.File_Types.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.Bottom.states.switch("default")
		
	if pin_t == 0 && opt1_l == 1
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.Bottom.states.switch("default")

	else if pin_t == 0 && opt1_l != 1
		lmv.File_Types.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.Bottom.states.switch("default")
			
			
lmv.TopSpot.on Events.MouseOut, ->
	if pin_t == 1 && pin_r ==1 && pin_l ==1 && pin_b ==1
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		lmv.Bottom.states.switch("slide")
		
	else if pin_t == 1 && pin_r ==0 && pin_l ==1 && pin_b ==0
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		
	else if pin_t == 1 && pin_r ==1 && pin_l ==0  && pin_b ==0
		lmv.Main.states.switch("slide")
		lmv.Right.states.switch("slide")
			
	
	else if pin_t == 1 && pin_r ==0 && pin_l ==0  && pin_b ==0
		lmv.Main.states.switch("slide")
	
	else if pin_t == 1 && pin_r ==0 && pin_l ==1  && pin_b ==1
		lmv.Main.states.switch("slide")	
		lmv.File_Types.states.switch("slide")
		lmv.Bottom.states.switch("slide")
				
	else if pin_t == 1 && pin_r ==0 && pin_l ==0  && pin_b ==1
		lmv.Main.states.switch("slide")	
		lmv.Bottom.states.switch("slide")	
	
	else if pin_t == 1 && pin_r ==1 && pin_l ==1  && pin_b ==0
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		
	else if pin_t == 1 && pin_r ==1 && pin_l ==0  && pin_b ==1
		lmv.Main.states.switch("slide")
		lmv.Right.states.switch("slide")
		lmv.Bottom.states.switch("slide")			
						
	else if pin_t == 0 && pin_r ==1 && pin_l ==1  && pin_b ==0
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		
	else if pin_t == 0 && pin_r ==0 && pin_l ==1 && pin_b ==0
		lmv.File_Types.states.switch("slide")
				

	else if pin_t == 0 && pin_r ==0 && pin_l ==1  && pin_b ==1
		lmv.File_Types.states.switch("slide")
		lmv.Bottom.states.switch("slide")
		
	else if pin_t == 0 && pin_r ==0 && pin_l ==0 && pin_b ==1
		lmv.Bottom.states.switch("slide")
				
	else if pin_t == 0 && pin_r ==1 && pin_l ==1 && pin_b ==1
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		lmv.Bottom.states.switch("slide")

	else if pin_t == 0 && pin_r ==1 && pin_l ==0 && pin_b ==1
		lmv.Right.states.switch("slide")
		lmv.Bottom.states.switch("slide")		

	else if pin_t == 0 && pin_r ==1 && pin_l ==0 && pin_b ==0
		lmv.Right.states.switch("slide")

# Top Right		
lmv.userSpot.on Events.MouseOver, ->
	lmv.User.opacity = 1
lmv.userSpot.on Events.MouseOut, ->
	lmv.User.opacity = 0.5	

lmv.shareSpot.on Events.MouseOver, ->
	lmv.Share.opacity = 1
lmv.shareSpot.on Events.MouseOut, ->
	lmv.Share.opacity = 0.5	
lmv.downloadSpot.on Events.MouseOver, ->
	lmv.Download.opacity = 1
lmv.downloadSpot.on Events.MouseOut, ->
	lmv.Download.opacity = 0.5	

# Toggle Bottom	
lmv.BottomSpot.on Events.MouseOver, ->
	if pin_b == 1
		lmv.Bottom.states.switch("default")
		
lmv.BottomSpot.on Events.MouseOut, ->
	if pin_b == 1
		lmv.Bottom.states.switch("slide")

				
lmv.RightSpot.on Events.MouseOut, ->
	if pin_r == 1
		lmv.Right.states.switch("slide")
		
lmv.RightSpot.on Events.MouseOver, ->
	if pin_r == 1
		lmv.Right.states.switch("default")

lmv.Containerspot.on Events.MouseOver, ->
	if pin_l == 1 && opt1_l == 1
		lmv.Sub_viewable.states.switch("init")	
		lmv.File_Types.states.switch("init")
	
	else if pin_l == 1 && opt1_l == 2
		lmv.Sub_viewable.states.switch("default")
		
		lmv.File_Types.states.switch("init")	
						
	else if pin_l == 1 && opt1_l == 0
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("default")

lmv.Containerspot.on Events.MouseOut, ->
	if pin_l == 1
		lmv.Sub_viewable.states.switch("default")			
		lmv.File_Types.states.switch("slide")
			
lmv.panSpot.on Events.MouseOver, ->	
	lmv.pan_init.opacity = 1
	lmv.Bottom.states.switch("default")

lmv.panSpot.on Events.MouseOut, ->	
	lmv.pan_init.opacity = 0.5
	
lmv.panmoreSpot.on Events.MouseOver, ->
	lmv.Bottom.states.switch("default")	
	if opt1_b == 0
		lmv.pan_more_init.opacity = 1
		lmv.pan_2_box.opacity = 1
		lmv.pan_2_init.opacity = 0.5
		lmv.pan_3_init.opacity = 0.5		
			
lmv.panmoreSpot.on Events.MouseOut, ->
		
	if opt1_b == 0
		lmv.pan_more_init.opacity = 0.5
		

lmv.panmoreSpot.on Events.Click, ->
	lmv.Bottom.states.switch("default")
	if opt1_b == 0	
		lmv.pan_2_box.opacity = 1
		lmv.pan_2_init.opacity = 0.5
		lmv.pan_more_init.opacity = 1
		opt1_b = 1
		
	else if opt1_b == 1	
		lmv.pan_2_box.opacity = 0
		opt1_b = 0
		
lmv.ClickOut.on Events.MouseOver, ->
	if opt1_b == 0	
		lmv.pan_2_box.opacity = 0
	lmv.pan_more_init.opacity = 0.5

		

lmv.ClickOut.on Events.Click, ->
	if opt1_b == 1	
		lmv.pan_2_box.opacity = 0
		opt1_b = 0
		
lmv.pan2Spot.on Events.MouseOver, ->
	lmv.Bottom.states.switch("default")
	lmv.pan_2_init.opacity = 1
	lmv.pan_more_init.opacity = 1

lmv.pan2Spot.on Events.MouseOut, ->
	lmv.pan_2_init.opacity = 0.5

lmv.pan3Spot.on Events.MouseOver, ->
	lmv.Bottom.states.switch("default")
	lmv.pan_3_init.opacity = 1
	lmv.pan_more_init.opacity = 1

lmv.pan3Spot.on Events.MouseOut, ->
	lmv.pan_3_init.opacity = 0.5	
		
lmv.designSpot.on Events.MouseOver, ->	
	lmv.d_init.opacity = 1	
	lmv.File_Types.states.switch("init")
	lmv.d_hover.visible = true
	lmv.d_hover.opacity = 1
	if opt1_l == 1
		lmv.d_hover.opacity = 0 	
		lmv.Sub_viewable.states.switchInstant("init")
	
lmv.designSpot.on Events.MouseOut, ->		
	lmv.d_init.opacity = 0.5	
	lmv.d_hover.opacity = 0
		
lmv.designSpot.on Events.Click, ->
	lmv.d_hover.opacity = 0
	if opt1_l == 0			
		lmv.d_selected.states.next()
		lmv.d_init.states.next()
		lmv.Sub_viewable.states.next()
		opt1_l = 1
		
	else if opt1_l == 1		
		lmv.d_selected.states.next()
		lmv.d_init.states.next()
		lmv.Sub_viewable.states.next()
		lmv.Containerspot.width = 100
		opt1_l = 0	

	else if opt1_l == 2	
		lmv.Sub_viewable.states.switch("init")
		lmv.Containerspot.width = 100
		opt1_l = 1	
		


lmv.closeSpot.on Events.MouseOver, ->
		lmv.close_sub.opacity = 1
 
lmv.closeSpot.on Events.MouseOut, ->
	lmv.close_sub.opacity = 0.5
				
lmv.closeSpot.on Events.Click, ->
	if opt1_l == 1
		lmv.Sub_viewable.states.switch("default")
		opt1_l = 2 
		
		
lmv.infoSpot.on Events.MouseOver, ->	
	if opt1_r == 0		
		lmv.info_hover.visible = true	
		lmv.info_hover.opacity = 1
		lmv.info_init.opacity = 1
		lmv.Right.states.switch("default")	
		
	else if opt1_r == 1			
		lmv.info_hover.opacity = 0	

lmv.infoSpot.on Events.MouseOut, ->	
	if opt1_r == 0			
		lmv.info_hover.opacity = 0
		lmv.info_init.opacity = 0.5	
			
lmv.infoSpot.on Events.Click, ->
	lmv.info_hover.opacity = 0	
	if opt1_r == 0			
		lmv.info_selected.opacity = 1
		lmv.r.opacity = 1
		lmv.RightSpot.width = 60
		lmv.RightSpot.x = 1380
		opt1_r = 1
		
		
	else if opt1_r == 1			
		lmv.info_selected.opacity = 0
		lmv.info_init.opacity = 0.5		
		lmv.r.opacity = 0
		lmv.RightSpot.width = 60
		lmv.RightSpot.x = 1380
		
		opt1_r = 0	

lmv.pinTop.on Events.MouseOver, ->
		
	if pin_t == 0
		lmv.pin_top.opacity = 1
		lmv.tooltip_unpin_top.visible = true
		lmv.tooltip_unpin_top.opacity = 1
		lmv.Main.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.Bottom.states.switch("default")
		lmv.File_Types.states.switch("init")
		
	else if pin_t == 1
		lmv.unpin_top.opacity = 1
		lmv.pin_top.opacity = 0
		lmv.tooltip_pin_top.visible = true
		lmv.tooltip_pin_top.opacity = 1
		lmv.Main.states.switch("init")
		lmv.Right.states.switch("default")
		lmv.File_Types.states.switch("init")
		lmv.Bottom.states.switch("default")
	
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
		lmv.unpin_right.opacity = 0.5	

		lmv.pin_bottom.opacity = 0
		lmv.unpin_bottom.visible = true	
		lmv.unpin_bottom.opacity = 0.5
				
		lmv.Main.states.switch("slide")
		lmv.File_Types.states.switch("slide")
		lmv.Right.states.switch("slide")
		lmv.Bottom.states.switch("slide")
		pin_l = 1
		pin_t = 1
		pin_r = 1
		pin_b = 1
			
		
	else if pin_t == 1
		lmv.pin_top.opacity = 1
		lmv.unpin_top.visible = false
		lmv.tooltip_pin_top.opacity = 0
		
		lmv.pin_left.opacity = 0.5
		lmv.unpin_left.visible = false
		lmv.tooltip_pin_left.opacity = 0		
		lmv.pin_right.opacity = 0.5
		lmv.unpin_right.visible = false
		lmv.tooltip_pin_right.opacity = 0		
		
		lmv.pin_bottom.opacity = 0.5
		lmv.unpin_bottom.visible = false
		lmv.tooltip_pin_bottom.opacity = 0		
				
		pin_t = 0
		pin_l = 0
		pin_r = 0
		pin_b = 0	



lmv.pinLeft.on Events.MouseOver, ->
		
	if pin_l == 0
		lmv.pin_left.opacity = 1
		lmv.tooltip_unpin_left.visible = true
		lmv.tooltip_unpin_left.opacity = 1
		lmv.File_Types.states.switch("init")
		
	else if pin_l == 1 && opt1_l == 1
		lmv.Sub_viewable.states.switch("init")
		lmv.unpin_left.opacity = 1
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.visible = true
		lmv.tooltip_pin_left.opacity = 1
		lmv.File_Types.states.switch("init")	

	else if pin_l == 1 && opt1_l == 0		
		lmv.unpin_left.opacity = 1
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.visible = true
		lmv.tooltip_pin_left.opacity = 1
		lmv.File_Types.states.switch("init")				
	else if pin_l == 1 && opt1_l == 2		
		lmv.unpin_left.opacity = 1
		lmv.pin_left.opacity = 0
		lmv.tooltip_pin_left.visible = true
		lmv.tooltip_pin_left.opacity = 1
		lmv.File_Types.states.switch("init")
		lmv.Sub_viewable.states.switch("default")		

	


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
		lmv.pin_right.opacity = 0.5
		lmv.tooltip_unpin_right.opacity = 0
		
		
	else
		lmv.unpin_right.opacity = 0.5
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


lmv.pinBottom.on Events.MouseOver, ->
	lmv.Bottom.states.switch("default")	
	if pin_b == 0
		lmv.pin_bottom.opacity = 1
		lmv.tooltip_unpin_bottom.visible = true
		lmv.tooltip_unpin_bottom.opacity = 1
		
		
	else if pin_b == 1 
		lmv.unpin_bottom.opacity = 1
		lmv.pin_bottom.opacity = 0
		lmv.tooltip_pin_bottom.visible = true
		lmv.tooltip_pin_bottom.opacity = 1
	
			
lmv.pinBottom.on Events.MouseOut, ->
	if pin_b == 0	
		lmv.pin_bottom.opacity = 0.5	
		lmv.tooltip_unpin_bottom.opacity = 0
		
		
	else if pin_b == 1 
		lmv.unpin_bottom.opacity = 0.5
		lmv.pin_bottom.opacity = 0
		lmv.tooltip_pin_bottom.opacity = 0
		

lmv.pinBottom.on Events.Click, ->
		
	if pin_b == 0	
		lmv.pin_bottom.opacity = 0
		lmv.tooltip_unpin_bottom.opacity = 0
		lmv.unpin_bottom.visible = true	
		lmv.unpin_bottom.opacity = 1			
		pin_b = 1
			
		
	else if pin_b == 1
		lmv.pin_bottom.opacity = 1
		lmv.unpin_bottom.opacity = 0
		lmv.tooltip_pin_bottom.opacity = 0	
		pin_b = 0	

		
# Set the animation options    
lmv.Sub_viewable.states.animationOptions = 
    curve: "ease-in-out"
    time: .1   

lmv.Main.states.animationOptions = 
    curve: "ease-in-out"
    time: .1   

lmv.Bottom.states.animationOptions = 
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