#!/usr/bin/env python

from PIL import Image
import glob, os


# Where to save the marginal plots
output_folder = "marginal_plots"

for infile in glob.glob("p*.png"):
    
    print("Processing image %s" % infile)

    filename, ext = os.path.splitext(infile)
    prefix = filename.split("_")[0]
    im = Image.open(infile)
    
    # Original image size
    width, height = im.size

    im_x_plot = im.crop((0, 0, 752, 125))
    im_y_plot = im.crop((752, 118, width, height)) 
    
    # Save the cropped images
    im_x_plot.save(os.path.join(output_folder, prefix + "_xplot.png"))
    im_y_plot.save(os.path.join(output_folder, prefix + "_yplot.png"))
