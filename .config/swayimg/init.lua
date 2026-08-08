-- ~/.config/swayimg/init.lua
-- Official Swayimg v5.5 Configuration (Tokyo Night Theme)

--------------------------------------------------------------------------------
-- General config
--------------------------------------------------------------------------------
swayimg.mode = "viewer"                  -- mode at startup
swayimg.antialiasing = true             -- anti-aliasing
swayimg.decoration = true               -- window title/buttons/borders
swayimg.overlay = false                 -- window overlay mode
swayimg.exif_orientation = true         -- image orientation by EXIF
swayimg.dnd_button = "MouseRight"       -- drag-and-drop mouse button

-- Format specific parameters
swayimg.set_format_params('raw', { camera_wb = true })

--------------------------------------------------------------------------------
-- Image list configuration
--------------------------------------------------------------------------------
swayimg.imagelist.order = "numeric"
swayimg.imagelist.reverse = false
swayimg.imagelist.recursive = false
swayimg.imagelist.adjacent = true
swayimg.imagelist.fsmon = true

--------------------------------------------------------------------------------
-- Text overlay configuration
--------------------------------------------------------------------------------
swayimg.text.visible = true
swayimg.text.font = "Netflix Sans Medium"
swayimg.text.size = 14
swayimg.text.spacing = 0
swayimg.text.padding = 10
swayimg.text.color = 0xffc0caf5             -- Tokyo Night Foreground (Main Text Color)
swayimg.text.background = 0x991a1b26        -- Tokyo Night Semi-transparent Background for readability
swayimg.text.shadow = 0x0d000000
swayimg.text.timeout = 5
swayimg.text.status_timeout = 3

--------------------------------------------------------------------------------
-- Image viewer mode
--------------------------------------------------------------------------------
swayimg.viewer.default_scale = "optimal"
swayimg.viewer.default_position = "center"
swayimg.viewer.drag_button = "MouseLeft"
swayimg.viewer.autocenter = true
swayimg.viewer.loop = true
swayimg.viewer.preload = 1
swayimg.viewer.history = 1
swayimg.viewer.mark_color = 0xff565f89      -- Tokyo Night Muted Gray
swayimg.viewer.pinch_factor = 1.0

-- Background settings
swayimg.viewer.set_window_background(0xff1a1b26) -- Tokyo Night Background
swayimg.viewer.set_image_chessboard(20, 0xff24283b, 0xff414868)

-- Overlay text blocks
swayimg.viewer.set_text("topleft", {
  "File:\t{name}",
  "Format:\t{format}",
  "File size:\t{sizehr}",
  "File time:\t{time}",
  "EXIF date:\t{meta.Exif.Photo.DateTimeOriginal}",
  "EXIF camera:\t{meta.Exif.Image.Model}"
})
swayimg.viewer.set_text("topright", {
  "Image:\t{list.index} of {list.total}",
  "Frame:\t{frame.index} of {frame.total}",
  "Size:\t{frame.width}x{frame.height}"
})
swayimg.viewer.set_text("bottomleft", {
  "Scale:\t{scale}"
})

-- Exit application
swayimg.viewer.on_key("Escape", function() swayimg.exit() end)
swayimg.viewer.on_key("q", function() swayimg.exit() end)

-- Mode toggles
swayimg.viewer.on_key("Return", function() swayimg.mode = "gallery" end)
swayimg.viewer.on_key("s", function() swayimg.mode = "slideshow" end)

-- Overlay visibility
swayimg.viewer.on_key("t", function() swayimg.text.visible = not swayimg.text.visible end)

-- Mark / Remove Image
swayimg.viewer.on_key("Insert", function() swayimg.viewer.mark_image() end)
swayimg.viewer.on_key("Delete", function()
  local img = swayimg.viewer.get_image()
  if img then swayimg.imagelist.remove(img.path) end
end)

-- Toggle Fullscreen & Antialiasing
swayimg.viewer.on_key("f", function() swayimg.fullscreen = not swayimg.fullscreen end)
swayimg.viewer.on_key("a", function() swayimg.antialiasing = not swayimg.antialiasing end)

-- Rotate & Flip
swayimg.viewer.on_key("]", function() swayimg.viewer.rotate(90) end)
swayimg.viewer.on_key("[", function() swayimg.viewer.rotate(270) end)
swayimg.viewer.on_key("m", function() swayimg.viewer.flip_vertical() end)
swayimg.viewer.on_key("Shift+m", function() swayimg.viewer.flip_horizontal() end)

-- Navigation: Left/Right Arrow Keys & Page Keys (Previous / Next Image)
swayimg.viewer.on_key("right", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("left", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("next", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("prior", function() swayimg.viewer.open("prev") end)

-- Modern Zoom: Up/Down Arrows, +, -
swayimg.viewer.on_key("up", function()
  swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("down", function()
  swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("equal", function()
  swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10
end)
swayimg.viewer.on_key("minus", function()
  swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10
end)

-- Panning with WASD
swayimg.viewer.on_key("w", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y + 20)
end)
swayimg.viewer.on_key("s", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y - 20)
end)
swayimg.viewer.on_key("a", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x + 20, pos.y)
end)
swayimg.viewer.on_key("d", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x - 20, pos.y)
end)

-- Reset position and zoom
swayimg.viewer.on_key("backspace", function() swayimg.viewer.reset() end)

-- Animated GIF frame stepping
swayimg.viewer.on_key("Shift+next", function() swayimg.viewer.frame = swayimg.viewer.frame + 1 end)
swayimg.viewer.on_key("Shift+prior", function()
  local frame = swayimg.viewer.frame
  if frame > 0 then swayimg.viewer.frame = frame - 1 end
end)

-- Mouse Panning & Zoom Controls
swayimg.viewer.on_mouse("ScrollUp", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y - 15)
end)
swayimg.viewer.on_mouse("ScrollDown", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y + 15)
end)
swayimg.viewer.on_mouse("ScrollLeft", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x - 15, pos.y)
end)
swayimg.viewer.on_mouse("ScrollRight", function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x + 15, pos.y)
end)

swayimg.viewer.on_mouse("Ctrl+ScrollUp", function()
  local mouse = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.scale
  swayimg.viewer.set_abs_scale(scale + scale / 10, mouse.x, mouse.y)
end)
swayimg.viewer.on_mouse("Ctrl+ScrollDown", function()
  local mouse = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.scale
  swayimg.viewer.set_abs_scale(scale - scale / 10, mouse.x, mouse.y)
end)

--------------------------------------------------------------------------------
-- Slide show mode
--------------------------------------------------------------------------------
swayimg.slideshow.timeout = 5
swayimg.slideshow.default_scale = "fit"
swayimg.slideshow.history = 0
swayimg.slideshow.set_window_background("auto")
swayimg.slideshow.set_text("topleft", { "{name}" })

swayimg.slideshow.on_key("s", function() swayimg.mode = "viewer" end)
swayimg.slideshow.on_key("Escape", function() swayimg.exit() end)
swayimg.slideshow.on_key("q", function() swayimg.exit() end)

--------------------------------------------------------------------------------
-- Gallery mode
--------------------------------------------------------------------------------
swayimg.gallery.thumb_size = 200
swayimg.gallery.aspect = "fill"
swayimg.gallery.padding_size = 5
swayimg.gallery.border_size = 5
swayimg.gallery.border_color = 0xff414868     -- Tokyo Night Border / Surface Highlight
swayimg.gallery.selected_scale = 1.15
swayimg.gallery.selected_color = 0xff7aa2f7   -- Tokyo Night Blue Accent
swayimg.gallery.unselected_color = 0xff24283b -- Tokyo Night Surface Dark
swayimg.gallery.window_color = 0xff1a1b26     -- Tokyo Night Background
swayimg.gallery.pinch_factor = 100.0
swayimg.gallery.hover = true
swayimg.gallery.cache = 100
swayimg.gallery.preload = false
swayimg.gallery.embedded_thumb = true
swayimg.gallery.pstore = false

swayimg.gallery.set_text("topleft", { "File:\t{name}" })
swayimg.gallery.set_text("topright", { "{list.index} of {list.total}" })

-- Mode toggles & Exit
swayimg.gallery.on_key("Escape", function() swayimg.exit() end)
swayimg.gallery.on_key("q", function() swayimg.exit() end)
swayimg.gallery.on_key("Return", function() swayimg.mode = "viewer" end)
swayimg.gallery.on_key("s", function() swayimg.mode = "slideshow" end)
swayimg.gallery.on_key("t", function() swayimg.text.visible = not swayimg.text.visible end)

-- Image list actions
swayimg.gallery.on_key("Insert", function() swayimg.gallery.mark_image() end)
swayimg.gallery.on_key("Delete", function()
  local img = swayimg.gallery.get_image()
  if img then swayimg.imagelist.remove(img.path) end
end)
swayimg.gallery.on_key("f", function() swayimg.fullscreen = not swayimg.fullscreen end)

-- Thumbnail sizing
swayimg.gallery.on_key("equal", function() swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10 end)
swayimg.gallery.on_key("minus", function() swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10 end)

-- Navigation Grid
swayimg.gallery.on_key("home", function() swayimg.gallery.select("first") end)
swayimg.gallery.on_key("end", function() swayimg.gallery.select("last") end)
swayimg.gallery.on_key("up", function() swayimg.gallery.select("up") end)
swayimg.gallery.on_key("down", function() swayimg.gallery.select("down") end)
swayimg.gallery.on_key("left", function() swayimg.gallery.select("left") end)
swayimg.gallery.on_key("right", function() swayimg.gallery.select("right") end)
swayimg.gallery.on_key("next", function() swayimg.gallery.select("pgdown") end)
swayimg.gallery.on_key("prior", function() swayimg.gallery.select("pgup") end)

-- Mouse Grid & Zoom Controls
swayimg.gallery.on_mouse("ScrollUp", function() swayimg.gallery.select("up") end)
swayimg.gallery.on_mouse("ScrollDown", function() swayimg.gallery.select("down") end)
swayimg.gallery.on_mouse("ScrollLeft", function() swayimg.gallery.select("left") end)
swayimg.gallery.on_mouse("ScrollRight", function() swayimg.gallery.select("right") end)

swayimg.gallery.on_mouse("Ctrl+ScrollUp", function() swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 10 end)
swayimg.gallery.on_mouse("Ctrl+ScrollDown", function() swayimg.gallery.thumb_size = swayimg.gallery.thumb_size - 10 end)
