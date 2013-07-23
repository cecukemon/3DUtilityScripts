#perl

my $color = "";

my @vmapList = lxq("query layerservice vmaps ?");
our @layers = lxq("query layerservice layers ? all");

my @views = ("front right", "front left", "back");

# ueber uv maps iterieren
foreach my $vMap (@vmapList){
	$vmapType = lxq("query layerservice vmap.type ? $vMap");
	if ($vmapType eq "texture"){
		$vmapName = lxq("query layerservice vmap.name ? $vMap");
		my $i = 1;
		foreach my $v (@views){
		        next if($vmapName eq "Texture");
		        next if($vmapName eq "TextureUV");
		        next if($vmapName eq "laces uv");
		        next if($vmapName eq "sole uv");
		        next if($vmapName eq "chunky");
		        lxout("uv map $vmapName");
		        lx("!!select.vertexMap [$vmapName] [txuv] [replace]");
		        
		        my $cam = "cam ".$v;
	        
		        foreach my $v2 (@views){
		                lx("layer.setVisibility [".$v2."] 0");
		        }
		        
		        lx("layer.setVisibility [".$v."] 1");
		        lx("render.camera [$cam]");
		        lxout("vis $v set to 1, rendering with $cam\n");
		        
		        my $filename = "D:\\tmp\\render\\".$vmapName."-".$color."-".$i.".tga";
		        
		        #lxout("would save $filename");
		        lx("bake filename:[$filename] format:[TGA]");
		        $i++;
		}
	}
}

