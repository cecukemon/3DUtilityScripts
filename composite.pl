#!/usr/bin/perl

use strict; use warnings;

use Image::Magick;

my $IMG_DIR = "imgs/";
my $FILE_EXT = ".tga";

opendir(IMG_DIR, $IMG_DIR) || die "can't open $IMG_DIR\n";
my @files = sort grep { !/^\.\.?$/ } readdir(IMG_DIR);
closedir(IMG_DIR);

# sandals-sign_beige_walnut_gold-1.tga
my %file_basenames;

foreach my $filename (@files) {
  my @t = split(/-/, $filename);
  $file_basenames{$t[0]."-".$t[1]."-"} = 1;
}

foreach my $file_basename (sort keys %file_basenames) {
  my $img = Image::Magick->new;

  $img->Read($IMG_DIR."/".$file_basename."1".$FILE_EXT);
  $img->Read($IMG_DIR."/".$file_basename."2".$FILE_EXT);
  $img->Read($IMG_DIR."/".$file_basename."3".$FILE_EXT);

  $img->[0]->Composite(image => $img->[1], compose => "Lighten",);
  $img->[0]->Composite(image => $img->[2], compose => "Lighten",);

  $img->Write(filename => $IMG_DIR."/".$file_basename."comp".$FILE_EXT);
}

