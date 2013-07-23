#!/usr/bin/perl

use strict; use warnings;

use Image::Magick;

my $IMG_DIR = "imgs/";
my $FILE_EXT = "tga";

opendir(IMG_DIR, $IMG_DIR) || die "can't open $IMG_DIR\n";
my @img = grep { -r "$IMG_DIR/$_" && -s "$IMG_DIR/$_" } readdir(IMG_DIR);
closedir(IMG_DIR);

foreach my $filename_old (@img) {
  my $filename_new = $filename_old;
  $filename_new =~ s/Final Color Output0000.tga$//;
  rename $IMG_DIR.$filename_old, $IMG_DIR.$filename_new;
}

1;
