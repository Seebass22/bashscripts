#!/usr/bin/env perl
# encode a video to be just under 8MB (to send on discord)
use warnings;
use strict;
use Getopt::Long;

my $div = 2;
my $audio_bitrate = 64;
my $target_filesize = 8;
my $muxing_overhead = 5;
my $input_file;
my $output_file = "out.mp4";

GetOptions(
	'div|d=i' => \$div,
	'a=i' => \$audio_bitrate,
	't=i' => \$target_filesize,
	'm=i' => \$muxing_overhead,
	'i=s' => \$input_file,
	'o=s' => \$output_file,
) or die "error in CLI options\n";
die "missing -i <INPUT_FILE>\n" unless $input_file;

my $duration = `ffprobe -v error -select_streams v:0 -show_entries format=duration -of default=noprint_wrappers=1:nokey=1  "$input_file"`;
my $mux = $muxing_overhead / 100;
my $total_filesize = $target_filesize * 8192;
my $video_bitrate = (($total_filesize / $duration) - ($mux + 1) * $audio_bitrate)/ ($mux + 1);

`ffmpeg -y -i "$input_file" -c:v libx264 -b:v ${video_bitrate}k -pass 1 -vf "scale=iw/${div}:-1" -vsync cfr -f null /dev/null && ffmpeg -y -i "$input_file" -c:v libx264 -b:v ${video_bitrate}k -pass 2 -vf "scale=iw/${div}:-1" -c:a libopus -b:a ${audio_bitrate}k "$output_file"`;
