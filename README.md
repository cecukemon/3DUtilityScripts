rendermon.pl

Modo script that bakes all the scene's objects and all their UVs 
(except those named Texture or TextureUV) to a file, from a list 
of specified cameras / light rigs.

This is mostly useful to bake textures with spec / diff for usage 
in game engines that do not support materials or do not have an
advanced lighting model with specularity. With this script you
can automatically bake the model from different perspectives 
(front, back, etc) after setting up the cameras / lighting properly.

composite.pl

Composites the multiple files generated by rendermon.pl into one
TGA file, with layer mode "lighten".

I don't use those scripts anymore, Substance Painter is that much better.
